<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';

?>

<div class="container">
    <h1>Fases do Processo</h1>

    <table>
        <tr>
            <th>Uni. Fabril</th>
            <th>Código</th>
            <th>Descrição</th>
            <th>Comunicação</th>
            <th>Fotografia</th>
            <th>Status Geral</th>
        </tr>

        <tr>
            <td>SC 1</td>
            <td>8060192</td>
            <td>MUNARI BRANCO AC 120X120</td>
            <td><span class="status andamento">Em Análise</span></td>
            <td><span class="status pendente">Pendente</span></td>
            <td><span class="status andamento">Em Andamento</span></td>
        </tr>

        <tr>
            <td>SC 2</td>
            <td>8061202</td>
            <td>MUNARI CIMENTO EXT 90X90</td>
            <td><span class="status aprovado">Aprovado</span></td>
            <td><span class="status aprovado">Aprovado</span></td>
            <td><span class="status aprovado">Finalizado</span></td>
        </tr>
    </table>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>