<?php

require_once __DIR__ . '/../../../config/conexao.php';

date_default_timezone_set('America/Sao_Paulo');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $metodo_detec = $_POST['metodo_detec'];
    $observacaoDetec = $_POST['observacao_detec'] ?? '';
    $proximaEtapaDetec = $_POST['proxima_etapa'];

    try {

        $pdo->beginTransaction();

        // Registro info detec
        $stmt = $pdo->prepare("
            INSERT INTO SM_processo_detec
            (processo_id, metodo_detec, observacao_detec, proxima_etapa)
            VALUES (?,?,?,?)
        ");

        $stmt->execute([
            $processoId,
            $metodo_detec,
            $observacaoDetec,
            $proximaEtapaDetec
        ]);

        // Salvando fase Atual para Atualizacao Log posteriormente

        $stmtEtapaAtual = $pdo->prepare("
            SELECT etapa_atual
            FROM SM_itens_processos
            WHERE id = ?
        ");
        $stmtEtapaAtual->execute([$processoId]);
        $etapaAtual = $stmtEtapaAtual->fetchColumn();

        // Atualizando etapda do item para a nova
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = ?,
            status_geral = 'em_andamento'
            WHERE id = ?
        ");

        $stmtupdate->execute([
            $proximaEtapaDetec,
            $processoId
        ]);

        // Salvando log da alteracao de fase

        $stmtLog = $pdo->prepare("
            INSERT INTO SM_itens_movimentacoes
            (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmtLog->execute([
            $processoId,
            $etapaAtual,
            $proximaEtapaDetec,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoDetec,
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