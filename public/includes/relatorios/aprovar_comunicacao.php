<?php
require_once __DIR__ . '/../../../config/conexao.php';
session_start();

$pacoteId = (int) $_POST['pacote_id'];
$usuario = $_SESSION['usuario'] ?? 'comunicacao';

try {
    $pdo->beginTransaction();

    // Atualiza pacote para finalizado
    $stmt = $pdo->prepare("
        UPDATE pacotes_envio
        SET status = 'finalizado',
            data_fechamento = NOW(),
            aprovado_por = ?
        WHERE id = ?
    ");
    $stmt->execute([$usuario, $pacoteId]);

    // Atualiza todos os itens vinculados
    $stmtItens = $pdo->prepare("
        UPDATE itens_processos
        SET status_geral = 'preparando_envio'
        WHERE id IN (SELECT processo_id FROM pacote_itens WHERE pacote_id = ?)
    ");
    $stmtItens->execute([$pacoteId]);

    $pdo->commit();

    header("Location: fotografia.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro: " . $e->getMessage());
}
