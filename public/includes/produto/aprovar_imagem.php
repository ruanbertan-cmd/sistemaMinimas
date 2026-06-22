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

// Atualiza o status da imagem conforme a ação recebida
$stmt = $pdo->prepare("UPDATE SM_item_imagens SET status = ? WHERE id = ?");
$stmt->execute([$acao, $imagemId]);

    // Buscando o processo_id do item para atualizar a etapa e registrar log
    $stmtProc = $pdo->prepare("
        SELECT p.id
        FROM SM_itens_processos p
        INNER JOIN SM_item_imagens im ON im.item_id = p.item_id
        WHERE im.id = ?

    ");
    $stmtProc->execute([$pacoteId]);
    $processoId = $stmtProc->fetchColumn();

    // Etapa atual
    $stmtEtapaAtual = $pdo->prepare("SELECT etapa_atual FROM SM_itens_processos WHERE id = ?");
    $stmtEtapaAtual->execute([$processoId]);
    $etapaAtual = $stmtEtapaAtual->fetchColumn();

if ($acao === 'atualizar') {
    // Se veio um novo arquivo
    if (!empty($_FILES['nova_imagem']['name']) && $_FILES['nova_imagem']['error'] === 0) {
        $arquivoTmp = $_FILES['nova_imagem']['tmp_name'];
        $nomeArquivo = uniqid() . '_' . basename($_FILES['nova_imagem']['name']);
        $destino = __DIR__ . '../relatorios/uploads/' . $nomeArquivo;
        move_uploaded_file($arquivoTmp, $destino);

        // Atualiza imagem no banco
        $stmt = $pdo->prepare("
            UPDATE SM_item_imagens
            SET status = 'pendente', caminho_arquivo = ?, data_upload = NOW(), caminho_arquivo = ?
            WHERE id = ?
        ");
        $stmt->execute([$nomeArquivo, $imagemId]);
    } else {
        // Se não anexou nada, apenas volta para pendente
        $stmt = $pdo->prepare("UPDATE SM_item_imagens SET status = 'pendente' WHERE id = ?");
        $stmt->execute([$imagemId]);
    }

    // Atualiza etapa para designers novamente
    $stmtupdate = $pdo->prepare("
        UPDATE SM_itens_processos
        SET etapa_atual = 'designers',
            status_geral = 'Imagem Atualizada - aguardando aprovação'
        WHERE id = ?
    ");
    $stmtupdate->execute([$processoId]);

    // Grava log
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

try {
    $pdo->beginTransaction();

    // Buscando o processo_id do item para atualizar a etapa e registrar log
    $stmtProc = $pdo->prepare("
        SELECT p.id
        FROM SM_itens_processos p
        INNER JOIN SM_item_imagens im ON im.item_id = p.item_id
        WHERE im.id = ?

    ");
    $stmtProc->execute([$pacoteId, $imagemId]);
    $processoId = $stmtProc->fetchColumn();

    if (!$processoId) {
        throw new Exception("Processo não encontrado para a imagem informada.");
    }

    // Etapa atual
    $stmtEtapaAtual = $pdo->prepare("SELECT etapa_atual FROM SM_itens_processos WHERE id = ?");
    $stmtEtapaAtual->execute([$processoId]);
    $etapaAtual = $stmtEtapaAtual->fetchColumn();

    // Atualiza etapa conforme ação
    $areaDestino = 'sistema_imagem';
    $acaoLog     = 'aprovado_imagem';
    $observacao  = 'Imagem aprovada, aguardando processamento para sistema de imagem';

    if ($acao === 'aprovado') {
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = 'sistema_imagem',
                status_geral = 'Imagem Aprovada'
            WHERE id = ?
        ");
        $stmtupdate->execute([$processoId]);

        // Registrando imagem aprovada para ser processada e vinculada ao item no sistema de imagem
        $stmtImagem = $pdo->prepare("
            INSERT INTO SM_item_imagens (
                item_id,
                processo_id,
                marca,
                categoria_pt_br,
                categoria_us,
                categoria_es,
                serie,
                tamanho_nominal,
                descricao,
                codigo_barras_cx,
                superficie_pt_br,
                superficie_us,
                superficie_es,
                junta_assentamento,
                abrasao_superficial,
                variacao_tonalidade,
                unidade_medida,
                pecas_caixa,
                m2_caixa,
                peso_caixa,
                coeficiente_atrito,
                espessura,
                grupo_absorcao,
                item_ativo,
                cor_pt_br,
                cor_us,
                cor_es,
                recomendado_uso,
                local_uso,
                retificado,
                polo,
                lancamento,
                estilo,
                estilo_us,
                estilo_es,
                relevo,
                rodape,
                numeros_face,
                tamanho_fabricacao,
                codigo_item,
                unidade_fabricacao,
                monocalibre,
                CicloLancamento,
                tem_minimas,
                status
            )
            SELECT 
                SM_item_imagens.item_id,
                SM_itens_processos.id AS processo_id,
                SM_cadastros_itens_minimas.marca,
                SM_cadastros_itens_minimas.categoria_pt_br,
                SM_cadastros_itens_minimas.categoria_us,
                SM_cadastros_itens_minimas.categoria_es,
                SM_cadastros_itens_minimas.serie,
                SM_cadastros_itens_minimas.tamanho_nominal,
                SM_cadastros_itens_minimas.descricao,
                SM_cadastros_itens_minimas.codigo_barras_cx,
                SM_cadastros_itens_minimas.superficie_pt_br,
                SM_cadastros_itens_minimas.superficie_us,
                SM_cadastros_itens_minimas.superficie_es,
                SM_cadastros_itens_minimas.junta_assentamento,
                SM_cadastros_itens_minimas.abrasao_superficial,
                SM_cadastros_itens_minimas.variacao_tonalidade,
                SM_cadastros_itens_minimas.unidade_medida,
                SM_cadastros_itens_minimas.pecas_caixa,
                SM_cadastros_itens_minimas.m2_caixa,
                SM_cadastros_itens_minimas.peso_caixa,
                SM_cadastros_itens_minimas.coeficiente_atrito,
                SM_cadastros_itens_minimas.espessura,
                SM_cadastros_itens_minimas.grupo_absorcao,
                SM_cadastros_itens_minimas.item_ativo,
                SM_cadastros_itens_minimas.cor_pt_br,
                SM_cadastros_itens_minimas.cor_us,
                SM_cadastros_itens_minimas.cor_es,
                SM_cadastros_itens_minimas.recomendado_uso,
                SM_cadastros_itens_minimas.local_uso,
                SM_cadastros_itens_minimas.retificado,
                SM_cadastros_itens_minimas.polo,
                SM_cadastros_itens_minimas.lancamento,
                SM_cadastros_itens_minimas.estilo,
                SM_cadastros_itensMinima.estilo_us,
                SM_cadastros_itensMinima.estilo_es,
                SM_cadastros_itensMinima.relevo,
                SM_cadastros_itensMinima.rodape,
                SM_cadastros_itensMinima.numeros_face,
                SM_cadastros_itensMinima.tamanho_fabricacao,
                SM_cadastros_itensMinima.codigo_item,
                SM_cadastros_itensMinima.unidade_fabricacao,
                SM_cadastros_itensMinima.monocalibre,
                SM_cadastros_itensMinima.CicloLancamento,
                1 AS tem_minimas,
                1 AS status
            FROM_SM_item_imagens
            INNER JOIN SM_itens_processos 
                ON SM_item_imagens.item_id = SM_itens_processos.item_id
            INNER JOIN SM_cadastros_itens_minimas 
                ON SM_item_imagens.item_id = SM_cadastros_itens_minimas.item_id
            WHERE SM_item_imagens.id = ?
        ");
        $stmtImagem->execute([$imagemId]);


    } elseif ($acao === 'rejeitado') {
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = 'fotografo',
                status_geral = 'Imagem Rejeitada'
            WHERE id = ?
        ");
        $stmtupdate->execute([$processoId]);

        $areaDestino = 'fotografo';
        $acaoLog     = 'rejeitado_imagem';
        $observacao  = 'Imagem reprovada, retornando para o fotógrafo';
    }

    // Log
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

    header("Location: fotografo.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro: " . $e->getMessage());
}
?>

<?php
/*// Se não estiver logado, redireciona para a página de validação
else:
    $link = 'http://ww1.eliane.com/sistemaminimas/index.php';
    $link = base64_encode($link);
    #header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    exit;
endif;
?>*/