<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';

?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Minimas</title>
</head>
<body>
<h1>Cadastro de Produtos</h1>

<form action="upload.php" method="POST" enctype="multipart/form-data">
    <input type="file" name="arquivo" required><br><br>
    <button type="submit">Enviar</button>
</form>

</body>
</html>