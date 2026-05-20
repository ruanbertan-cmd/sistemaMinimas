<?php
require_once __DIR__ . '/../../../config/conexao.php';

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

        move_uploaded_file($tmpName, $destino);

        $stmt = $pdo->prepare("
            INSERT INTO item_imagens (item_id, pacote_id, caminho_arquivo, tipo)
            VALUES (?, ?, ?, ?)
        ");
        $stmt->execute([$itemId, $pacoteId, $nomeArquivo, $tipo]);
    }
}

echo "Upload concluído!";
?>
