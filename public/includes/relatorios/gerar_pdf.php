<?php
require_once __DIR__ . '/../config/conexao.php';

// Buscar itens com peças separadas (foto ou vídeo)
$stmt = $pdo->query("
    SELECT i.codigo_item, i.descricao, i.tamanho_nominal,
           c.qtd_pecas_foto, c.qtd_pecas_video
    FROM itens_processos p
    JOIN cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN processo_comunicacao c ON c.processo_id = p.id
    WHERE (c.qtd_pecas_foto > 0 OR c.qtd_pecas_video > 0)
");
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Relatório de Itens</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h1 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #000; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Relatório de Itens com Peças Separadas</h1>
    <table>
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Dimensão</th>
            <th>Foto</th>
            <th>Vídeo</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) ?></td>
            <td><?= htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['qtd_pecas_foto']) ?></td>
            <td><?= htmlspecialchars($item['qtd_pecas_video']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html>
