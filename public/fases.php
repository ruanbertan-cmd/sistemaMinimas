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
    <h1>Fases do Processo</h1>
    <p>Aqui você pode acompanhar as fases do processo de cada pendência. As fases incluem:</p>

    <!-- Tabela com os itens que vêm do cadastro, logo apóes inclusão no sistema (Ordenação por cadastros), incluir filtro para ver por Deptos -->
    <table border="1">
        <tr>
            <th>Uni. Fabril</th>
            <th>Código</th>
            <th>Descrição</th>
            <th>Departamento Atual</th>
            <th>Fase</th>
        </tr>
        <tr>
            <td>SC 1</td>
            <td>8060192</td>
            <td>MUNARI BRANCO AC 120X120</td>
            <td>Comunicação</td>
            <td>Aguardando Definição Still/Vídeos</td>
        </tr>
        <tr>
            <td>SC 2</td>
            <td>8061202</td>
            <td>MUNARI CIMENTO EXT 90X90</td>
            <td>Detec</td>
            <td>Aguardando Separação das peças</td>
        </tr>

        <!-- Exemplo de dados, substituir por dados reais do sistema -->


</body>
</html>