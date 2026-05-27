<?php
require_once __DIR__ . '/../../../config/conexao.php';
session_start();

$imagemId = (int) $_POST['imagem_id'];
$acao = $_POST['acao'];
if (!in_array($acao, ['aprovado','rejeitado'])) {
    die("Ação inválida.");
}

$stmt = $pdo->prepare("UPDATE SM_item_imagens SET status = ? WHERE id = ?");
$stmt->execute([$acao, $imagemId]);

header("Location: " . $_SERVER['HTTP_REFERER']);

// Inicio processo de atualização de etapa e log

$pacoteId = (int) $_POST['pacote_id'];
$usuario = $_SESSION['usuario'] ?? 'design';

try {
    $pdo->beginTransaction();

    // Buscando o processo_id do item para atualizar a etapa e registrar log
    $stmtProc = $pdo->prepare("
        SELECT p.id 
        FROM SM_itens_processos p
        INNER JOIN SM_pacote_itens pi ON pi.processo_id = p.id
        WHERE pi.pacote_id = ? AND p.item_id = ?
    ");
    $stmtProc->execute([$pacoteId, $itemId]);
    $processoId = $stmtProc->fetchColumn();


    // Salvando fase Atual para Atualizacao Log posteriormente
    $stmtEtapaAtual = $pdo->prepare("
        SELECT etapa_atual
        FROM SM_itens_processos
        WHERE id = ?
    ");
    $stmtEtapaAtual->execute([$processoId]);
    $etapaAtual = $stmtEtapaAtual->fetchColumn();
    // Atualizando etada do item para a nova
    $stmtupdate = $pdo->prepare("

        if ($acao === 'aprovado') {
            UPDATE SM_itens_processos
            SET etapa_atual = 'sistema_imagem',
            status_geral = 'Imagem Aprovada'
            WHERE id = ?
        } else {
            UPDATE SM_itens_processos
            SET etapa_atual = 'fotografo',
            status_geral = 'Imagem Rejeitada'
            WHERE id = ?
        }
    ");
    $stmtupdate->execute([
        $processoId
    ]);
    // Salvando log da alteracao de fase
    if ($acao === 'aprovado') {
        $areaDestino = 'sistema_imagem';
        $acaoLog     = 'aprovavo_imagem';
        $observacao  = 'Imagem Aprovada, aguardando processamento para sistema de imagem';
    } else {
        $areaDestino = 'fotografo';
        $acaoLog     = 'rejeitado_imagem';
        $observacao  = 'Imagem Reprovada, retornando para o fotografo';
    }

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
        'usuarioSistema',
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
