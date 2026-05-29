<?php
require_once __DIR__ . '/../../../config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $tipoPendencia = $_POST['tipo_pendencia'];
    $comentario = $_POST['comentario_validacao'];
    $acao = $_POST['acao'];
    $proximaEtapa = $_POST['proxima_etapa'];

    $status = ($acao === 'validar') ? 'validada' : 'rejeitada';

    $stmt = $pdo->prepare("
        UPDATE SM_evidencias_inteligenciaMercado
        SET status_evidencia = ?, comentario_validacao = ?
        WHERE processo_id = ? AND tipo_pendencia = ?
    ");
    $stmt->execute([$status, $comentario, $processoId, $tipoPendencia]);

    // Atualiza etapa do processo
    $stmtUpdate = $pdo->prepare("
        UPDATE SM_itens_processos
        SET etapa_atual = ?, status_geral = 'em_andamento'
        WHERE id = ?
    ");
    $stmtUpdate->execute([$proximaEtapa, $processoId]);

    header("Location: pendencias.php?id=$processoId");
    exit;
}
