<?php
require_once __DIR__ . '/../../../config/conexao.php';
session_start();

$pacoteId = (int) $_POST['pacote_id'];
$usuario = $_SESSION['usuario'] ?? 'amostra';

try {
    $pdo->beginTransaction();

    // Atualiza pacote com data de envio
    $stmt = $pdo->prepare("
        UPDATE pacotes_envio
        SET data_envio = NOW()
        WHERE id = ?
    ");
    $stmt->execute([$pacoteId]);

    // Atualiza todos os itens vinculados para status 'enviado' e data que o processo foi finalizado
    $stmtItens = $pdo->prepare("
        UPDATE itens_processos
        SET status_geral = 'enviado' AND finalizado = NOW()
        WHERE id IN (SELECT processo_id FROM pacote_itens WHERE pacote_id = ?)
    ");
    $stmtItens->execute([$pacoteId]);

    // Registrar movimentação
    $stmtLog = $pdo->prepare("
        INSERT INTO itens_movimentacoes (processo_id, area_origem, area_destino, acao, usuario, observacao)
        SELECT processo_id, 'fotografia', 'amostra', 'envio_pecas', ?, 'Peças enviadas'
        FROM pacote_itens
        WHERE pacote_id = ?
    ");
    $stmtLog->execute([$usuario, $pacoteId]);

    $pdo->commit();

    header("Location: fotografia.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro ao enviar peças: " . $e->getMessage());
}
