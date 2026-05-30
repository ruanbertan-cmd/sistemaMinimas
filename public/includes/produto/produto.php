<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';

$sql = "
SELECT 
    i.id AS item_id,
    i.unidade_fabricacao,
    i.codigo_item,
    i.descricao,
    i.tamanho_nominal,
    i.marca,
    i.numeros_face,
    COUNT(im.id) AS total_arquivos,
    CASE
        WHEN SUM(im.status = 'pendente') > 0 THEN 'Pendente'
        WHEN SUM(im.status = 'rejeitado') > 0 THEN 'Rejeitado'
        ELSE 'Aprovado'
    END AS status_item
FROM SM_cadastros_itens_minimas i
INNER JOIN SM_itens_processos p ON p.item_id = i.id
INNER JOIN SM_pacote_itens pi ON pi.processo_id = p.id
INNER JOIN SM_pacotes_envio pe ON pe.id = pi.pacote_id
INNER JOIN SM_item_imagens im ON im.item_id = i.id AND im.pacote_id = pe.id
GROUP BY i.id, i.unidade_fabricacao, i.codigo_item, i.descricao, i.tamanho_nominal, i.marca
ORDER BY i.id DESC

";
$stmt = $pdo->query($sql);
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>
<div class="container">
    <h1>Itens com Imagem para Aprovação</h1>
    <table class="tabela-itens">
        <tr>
            <th>Uni Fabril</th>
            <th>Código</th>
            <th>Descrição</th>
            <th>Marca</th>
            <th>Qtd Faces</th>
            <th>Situação</th>
            <th>Visualizar Imagens</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['unidade_fabricacao']) ?></td>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) . ' ' . htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>
            <td><?= $item['numeros_face'] ?></td>
            <td><?= $item['status_item'] ?></td>
            <td><a href="produto_detalhes.php?item_id=<?= $item['item_id'] ?>" class="btn-detalhes">Visualizar</a></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

<?php require_once __DIR__ . '/../layout/footer.php'; ?>

<?php
/*// Se não estiver logado, redireciona para a página de validação
else:
    $link = 'http://ww1.eliane.com/sistemaminimas/index.php';
    $link = base64_encode($link);
    #header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    exit;
endif;
?>*/