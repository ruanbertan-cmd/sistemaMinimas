<?php
require_once __DIR__ . '/../../../config/conexao.php';
session_start();

$pacoteId = (int) $_POST['pacote_id'];
$itemId   = (int) $_POST['item_id'];
$tipo     = $_POST['tipo'];

foreach ($_FILES['arquivos']['tmp_name'] as $index => $tmpName) {
    if ($_FILES['arquivos']['error'][$index] === UPLOAD_ERR_OK) {
        $nomeArquivo = basename($_FILES['arquivos']['name'][$index]);
        // Cria a pasta se não existir
        $uploadDir = __DIR__ . "/uploads/";
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0775, true);
        }

        $destino = $uploadDir . $nomeArquivo;

        if (!move_uploaded_file($tmpName, $destino)) {
            throw new Exception("Falha ao mover o arquivo: $nomeArquivo");
        }

        $stmt = $pdo->prepare("
            INSERT INTO SM_item_imagens (item_id, pacote_id, caminho_arquivo, tipo)
            VALUES (?, ?, ?, ?)
        ");
        $stmt->execute([$itemId, $pacoteId, $nomeArquivo, $tipo]);
    }
}

$usuario = $_SESSION['usuario'] ?? 'fotografo';

try {
    $pdo->beginTransaction();

    // Buscando o processo_id do item para atualizar a etapa e registrar log
    $stmtProc = $pdo->prepare("
        SELECT p.id 
        FROM itens_processos p
        INNER JOIN pacote_itens pi ON pi.processo_id = p.id
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
        UPDATE SM_itens_processos
        SET etapa_atual = 'design',
        status_geral = 'aguardando_aprovacao_imagens'
        WHERE id = ?
    ");
    $stmtupdate->execute([
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
        'fotografo',
        'design',
        'upload_imagens',
        'usuarioSistema',
        'aguardando aprovação das imagens',
        date('Y-m-d H:i:s')
    ]);

    $pdo->commit();

    header("Location: pacote_detalhes.php?id=" . $pacoteId);
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro: " . $e->getMessage());
}

?>
