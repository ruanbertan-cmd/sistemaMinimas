<?php
require_once __DIR__ . '/../../../config/conexao.php';

$imagemId = (int) $_POST['imagem_id'];
$acao = $_POST['acao'];
if (!in_array($acao, ['aprovado','rejeitado'])) {
    die("Ação inválida.");
}

$stmt = $pdo->prepare("UPDATE item_imagens SET status = ? WHERE id = ?");
$stmt->execute([$acao, $imagemId]);

header("Location: " . $_SERVER['HTTP_REFERER']);
exit;
?>
