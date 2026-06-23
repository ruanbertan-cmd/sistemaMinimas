<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

$imagemId = (int) $_POST['imagem_id'];
$acao     = $_POST['acao'];
$pacoteId = (int) ($_POST['pacote_id'] ?? 0);
$usuario  = $_SESSION['usuario'] ?? 'usuarioSistema';

try {
    $pdo->beginTransaction();

    // Atualiza o status da imagem conforme a ação recebida
    $stmt = $pdo->prepare("UPDATE SM_item_imagens SET status = ? WHERE id = ?");
    $stmt->execute([$acao, $imagemId]);

    // Busca o processo vinculado à imagem
    $stmtProc = $pdo->prepare("
        SELECT p.id
        FROM SM_itens_processos p
        INNER JOIN SM_item_imagens im ON im.item_id = p.item_id
        WHERE im.id = ?
    ");
    $stmtProc->execute([$imagemId]);
    $processoId = $stmtProc->fetchColumn();

    if (!$processoId) {
        throw new Exception("Processo não encontrado para a imagem informada.");
    }

    // Etapa atual
    $stmtEtapaAtual = $pdo->prepare("SELECT etapa_atual FROM SM_itens_processos WHERE id = ?");
    $stmtEtapaAtual->execute([$processoId]);
    $etapaAtual = $stmtEtapaAtual->fetchColumn();

    if ($acao === 'atualizar') {
        // Upload de nova imagem
        if (!empty($_FILES['nova_imagem']['name']) && $_FILES['nova_imagem']['error'] === 0) {
            $arquivoTmp   = $_FILES['nova_imagem']['tmp_name'];
            $nomeArquivo  = uniqid() . '_' . basename($_FILES['nova_imagem']['name']);
            $destino      = __DIR__ . '/../relatorios/uploads/' . $nomeArquivo;
            move_uploaded_file($arquivoTmp, $destino);

            $stmt = $pdo->prepare("
                UPDATE SM_item_imagens
                SET status = 'pendente',
                    caminho_arquivo = ?,
                    data_upload = NOW()
                WHERE id = ?
            ");
            $stmt->execute([$nomeArquivo, $imagemId]);
        } else {
            $stmt = $pdo->prepare("UPDATE SM_item_imagens SET status = 'pendente' WHERE id = ?");
            $stmt->execute([$imagemId]);
        }

        // Atualiza etapa para designers
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = 'designers',
                status_geral = 'aguardando_aprovacao_imagens'
            WHERE id = ?
        ");
        $stmtupdate->execute([$processoId]);

        // Log
        $stmtLog = $pdo->prepare("
            INSERT INTO SM_itens_movimentacoes
            (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
            VALUES (?,?,?,?,?,?,?)
        ");
        $stmtLog->execute([
            $processoId,
            $etapaAtual,
            'designers',
            'atualizar_imagem',
            $usuario,
            'Imagem atualizada, aguardando nova aprovação dos designers',
            date('Y-m-d H:i:s')
        ]);

        $pdo->commit();
        header("Location: " . $_SERVER['HTTP_REFERER']);
        exit;
    }

    // Declarando variais antes para retirar o error de variáveis não definidas no log
    $areaDestino = '';
    $acaoLog     = '';
    $observacao  = '';

    // Fluxo de aprovação/rejeição
    if ($acao === 'aprovado') {
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = 'inteligencia_mercado',
                status_geral = 'finalizado'
            WHERE id = ?
        ");
        $stmtupdate->execute([$processoId]);

        // Copia dados para SM_sistema_imagens
        $stmtImagem = $pdo->prepare("
            INSERT INTO SM_sistema_imagens (
                item_id, processo_id, marca, categoria_pt_br, categoria_us, categoria_es,
                serie, tamanho_nominal, descricao, codigo_barras_cx,
                superficie_pt_br, superficie_us, superficie_es,
                junta_assentamento, abrasao_superficial, variacao_tonalidade,
                unidade_medida, pecas_caixa, m2_caixa, peso_caixa,
                coeficiente_atrito, espessura, grupo_absorcao, item_ativo,
                cor_pt_br, cor_us, cor_es, recomendado_uso, local_uso,
                retificado, polo, lancamento, estilo, estilo_us, estilo_es,
                relevo, rodape, numeros_face, tamanho_fabricacao,
                codigo_item, unidade_fabricacao, monocalibre, ciclo_lancamento,
                tem_minimas, status
            )
            SELECT 
                im.item_id,
                p.id AS processo_id,
                m.marca, m.categoria_pt_br, m.categoria_us, m.categoria_es,
                m.serie, m.tamanho_nominal, m.descricao, m.codigo_barras_cx,
                m.superficie_pt_br, m.superficie_us, m.superficie_es,
                m.junta_assentamento, m.abrasao_superficial, m.variacao_tonalidade,
                m.unidade_medida, m.pecas_caixa, m.m2_caixa, m.peso_caixa,
                m.coeficiente_atrito, m.espessura, m.grupo_absorcao, m.item_ativo,
                m.cor_pt_br, m.cor_us, m.cor_es, m.recomendado_uso, m.local_uso,
                m.retificado, m.polo, m.lancamento, m.estilo, m.estilo_us, m.estilo_es,
                m.relevo, m.rodape, m.numeros_face, m.tamanho_fabricacao,
                m.codigo_item, m.unidade_fabricacao, m.monocalibre, m.ciclo_lancamento,
                1 AS tem_minimas, 1 AS status
            FROM SM_item_imagens im
            INNER JOIN SM_itens_processos p ON im.item_id = p.item_id
            INNER JOIN SM_cadastros_itens_minimas m ON im.item_id = m.id
            WHERE im.id = ?
        ");
        $stmtImagem->execute([$imagemId]);

        $areaDestino = 'sistema_imagem';
        $acaoLog     = 'aprovado_imagem';
        $observacao  = 'Imagem aprovada, aguardando processamento para sistema de imagem';

    } elseif ($acao === 'rejeitado') {
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = 'fotografia',
                status_geral = 'aguardando_imagem'
            WHERE id = ?
        ");
        $stmtupdate->execute([$processoId]);

        $areaDestino = 'fotografia';
        $acaoLog     = 'rejeitado_imagem';
        $observacao  = 'Imagem reprovada, retornando para o fotógrafo';
    }

    // Log final
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes
        (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
        VALUES (?,?,?,?,?,?,?)
    ");
    $stmtLog->execute([
        $processoId,
        $etapaAtual,
        $areaDestino,
        $acaoLog,
        $usuario,
        $observacao,
        date('Y-m-d H:i:s')
    ]);

    $pdo->commit();
    // Recupera o item_id da imagem
    $stmtItem = $pdo->prepare("SELECT item_id FROM SM_item_imagens WHERE id = ?");
    $stmtItem->execute([$imagemId]);
    $itemId = $stmtItem->fetchColumn();

    // Redireciona para os detalhes do produto
    header("Location: /includes/produto/produto_detalhes.php?item_id=" . $itemId);
    exit;

} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro: " . $e->getMessage());
}

/*// Se não estiver logado, redireciona para a página de validação
else:
    $link = 'http://ww1.eliane.com/sistemaminimas/index.php';
    $link = base64_encode($link);
    #header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    exit;
endif;
?>*/