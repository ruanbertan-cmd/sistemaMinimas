<?php
require_once __DIR__ . '/../../../config/conexao.php';
session_start();

$pacoteId = (int) $_POST['pacote_id'];
$processoId = (int) $_POST['processo_id'];
$usuario = $_SESSION['usuario'] ?? 'comunicacao';

try {
    $pdo->beginTransaction();

    // Atualiza pacote para finalizado
    $stmt = $pdo->prepare("
        UPDATE SM_pacotes_envio
        SET status = 'finalizado',
            data_fechamento = NOW(),
            aprovado_por = ?
        WHERE id = ?
    ");
    $stmt->execute([$usuario, $pacoteId]);

    // Atualiza todos os itens vinculados
    $stmtItens = $pdo->prepare("
        UPDATE SM_itens_processos
        SET status_geral = 'preparando_envio'
        WHERE id IN (SELECT processo_id FROM SM_pacote_itens WHERE pacote_id = ?)
    ");
    $stmtItens->execute([$pacoteId]);

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
        'preparando_envio',
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
        'fotografo',
        'aprovar_envio_pecas',
        'usuarioSistema',
        'Aprovando envio das peças separadas na amostra',
        date('Y-m-d H:i:s')
    ]);

    $pdo->commit();

    header("Location: fotografo.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro: " . $e->getMessage());
}
