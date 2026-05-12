<?php
require_once __DIR__ . '/../../../config/conexao.php';

$pacoteId = (int) $_GET['id'];

$stmt = $pdo->prepare("
    SELECT i.codigo_item, i.descricao, i.tamanho_nominal, i.marca
    FROM pacote_itens pi
    INNER JOIN itens_processos p ON p.id = pi.processo_id
    INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
    WHERE pi.pacote_id = ?
");
$stmt->execute([$pacoteId]);
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="container">
    <h1>Itens do Pacote #<?= $pacoteId ?></h1>
    <table>
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Dimensão</th>
            <th>Marca</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) ?></td>
            <td><?= htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
