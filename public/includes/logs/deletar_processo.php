<?php
session_start();
require_once __DIR__ . '/../../../config/conexao.php';

date_default_timezone_set('America/Sao_Paulo');

if (!isset($_GET['id'])) {
    die("Processo não informado.");
}

$processoId = (int) $_GET['id'];


try {
    // Atualizar status para cancelado
    $stmt = $pdo->prepare("UPDATE SM_itens_processos SET status_geral = 'cancelado' WHERE id = ?");
    $stmt->execute([$processoId]);

    // Registrar movimentação de cancelamento
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes (processo_id, area_origem, area_destino, acao, usuario, observacao)
        VALUES (?, ?, ?, ?, ?, ?)
    ");
    $stmtLog->execute([
        $processoId,
        'sistema',
        'cancelado',
        'processo_cancelado',
        $_SESSION['usuario'] ?? 'sistema',
        'Processo cancelado manualmente via tela de fases'
    ]);

    header("Location: fases.php");
    exit;
} catch (Exception $e) {
    die("Erro ao cancelar: " . $e->getMessage());
}