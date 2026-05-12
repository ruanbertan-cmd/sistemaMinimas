<?php
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../../../config/conexao.php';

$stmt = $pdo->query("
    SELECT 
        p.id AS pacote_id,
        p.status,
        p.data_criacao,
        p.data_fechamento,
        p.aprovado_por,
        COUNT(pi.id) AS qtd_itens
    FROM pacotes_envio p
    LEFT JOIN pacote_itens pi ON pi.pacote_id = p.id
    GROUP BY p.id
    ORDER BY p.id DESC
");
$pacotes = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="container">
    <h1>Pacotes de Fotografia</h1>
    <table>
        <tr>
            <th>ID Pacote</th>
            <th>Status</th>
            <th>Qtd Itens</th>
            <th>Data Abertura</th>
            <th>Data Fechamento</th>
            <th>Aprovado por</th>
            <th>Ações</th>
        </tr>
        <?php foreach ($pacotes as $pacote): ?>
        <tr>
            <td><?= $pacote['pacote_id'] ?></td>
            <td><?= ucfirst($pacote['status']) ?></td>
            <td><?= $pacote['qtd_itens'] ?></td>
            <td><?= date('d/m/Y H:i', strtotime($pacote['data_criacao'])) ?></td>
            <td><?= $pacote['data_fechamento'] ? date('d/m/Y H:i', strtotime($pacote['data_fechamento'])) : '-' ?></td>
            <td><?= $pacote['aprovado_por'] ?? '-' ?></td>
            <td>
                <a href="pacote_detalhes.php?id=<?= $pacote['pacote_id'] ?>">Ver Itens</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
