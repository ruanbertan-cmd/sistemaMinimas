<?php
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Minimas</title>
</head>
<body>
    <nav>
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="cadastro.php">Cadastro</a></li>
            <li><a href="fases.php">Fases</a></li>
            <li><a href="admin.php">Administração</a></li>
        </ul>
    </nav>
    </ul>

    <h1>Cadastro de Produtos</h1>
    <form action="upload.php" method="POST" enctype="multipart/form-data">
        <input type="file" name="arquivo" required><br><br>
        <button type="submit">Enviar</button>
    </form>

</body>
</html>