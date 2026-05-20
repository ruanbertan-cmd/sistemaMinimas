<?php
require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../layout/header.php';

$sql = "
SELECT 
    i.id AS item_id,
    i.unidade_fabricacao,
    i.codigo_item,
    i.descricao,
    i.tamanho_nominal,
    i.marca,
    i.numeros_face,
    COUNT(im.id) AS total_arquivos
FROM cadastros_itens_minimas i
INNER JOIN itens_processos p ON p.item_id = i.id
INNER JOIN pacote_itens pi ON pi.processo_id = p.id
INNER JOIN pacotes_envio pe ON pe.id = pi.pacote_id
INNER JOIN item_imagens im ON im.item_id = i.id AND im.pacote_id = pe.id
GROUP BY i.id, i.codigo_item, i.descricao, i.tamanho_nominal, i.marca
ORDER BY i.id DESC

";
$stmt = $pdo->query($sql);
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<a href="pacote.php" class="btn btn-secondary" style="margin-top:90px;"><- Voltar</a>

    <h2>Itens com Imagem para Aprovação</h2><br>
    <table class="tabela-itens">
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Dimensão</th>
            <th>Marca</th>
            <th>Qtd Faces</th>
            <th>Visualizar Imagens</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['unidade_fabricacao']) ?></td>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) . ' ' . htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>
            <td><?= $item['numeros_face'] ?></td>
            <td><a href="produto_detalhes.php?item_id=<?= $item['item_id'] ?>" class="btn btn-primary">Visualizar</a></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
