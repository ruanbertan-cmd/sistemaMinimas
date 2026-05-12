<?php

date_default_timezone_set('America/Sao_Paulo');

require_once __DIR__ . '/../../../config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $pecasSeparadas = $_POST['pecas_separadas'] ?? '';
    $qtdDeAcordo = $_POST['qtd_de_acordo'] ?? '';
    $qualidade = $_POST['qualidade'] ?? '';
    $identificacao = $_POST['identificacao'] ?? '';
    $observacaoInteligenciaMercado = $_POST['observacao_inteligenciaMercado'] ?? '';
    $proximaEtapaInteligenciaMercado = $_POST['proxima_etapa'] ?? '';

    try {

        $pdo->beginTransaction();

        // Registro info Inteligencia de Mercado
        $stmt = $pdo->prepare("
            INSERT INTO processo_inteligenciaMercado
            (processo_id, pecas_separadas, qtd_de_acordo, qualidade, identificacao, observacao_inteligenciaMercado, proxima_etapa)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmt->execute([
            $processoId,
            $pecasSeparadas,
            $qtdDeAcordo,
            $qualidade,
            $identificacao,
            $observacaoInteligenciaMercado,
            $proximaEtapaInteligenciaMercado
        ]);

        // Salvando fase Atual para Atualizacao Log posteriormente

        $stmtEtapaAtual = $pdo->prepare("
            SELECT etapa_atual
            FROM itens_processos
            WHERE id = ?
        ");
        $stmtEtapaAtual->execute([$processoId]);
        $etapaAtual = $stmtEtapaAtual->fetchColumn();

        // Atualizando etapda do item para a nova
        $stmtupdate = $pdo->prepare("
            UPDATE itens_processos
            SET etapa_atual = ?,
            status_geral = 'em_andamento'
            WHERE id = ?
        ");

        $stmtupdate->execute([
            $proximaEtapaInteligenciaMercado,
            $processoId
        ]);


        // Se a próxima etapa for fotografia, vincula o item a um pacote
        if ($proximaEtapaInteligenciaMercado === 'fotografia') {
            // Verifica se já existe pacote aberto
            $stmtPacote = $pdo->query("SELECT id FROM pacotes_envio WHERE status='aberto' LIMIT 1");
            $pacoteId = $stmtPacote->fetchColumn();

            if (!$pacoteId) {
                $stmtInsertPacote = $pdo->prepare("INSERT INTO pacotes_envio (status, aprovado_por) VALUES ('aberto', ?)");
                $stmtInsertPacote->execute(['InteligenciaMercado']);
                $pacoteId = $pdo->lastInsertId();
            }

            // Vincula item ao pacote
            $stmtItem = $pdo->prepare("INSERT INTO pacote_itens (pacote_id, processo_id) VALUES (?, ?)");
            $stmtItem->execute([$pacoteId, $processoId]);
        }


        // Salvando log da alteracao de fase

        $stmtLog = $pdo->prepare("
            INSERT INTO itens_movimentacoes
            (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmtLog->execute([
            $processoId,
            $etapaAtual,
            $proximaEtapaInteligenciaMercado,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoInteligenciaMercado,
            date('Y-m-d H:i:s')
        ]);

        $pdo->commit();

        header("Location: ../logs/fases.php");
        exit;
    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
    }
}