<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
require_once __DIR__ . '/config/conexao.php';

function e($valor) {
    return htmlspecialchars((string)($valor ?? ''));
}

$processo_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$processo_id) {
    echo "<div class='container'><h2>Processo inválido.</h2></div>";
    require_once __DIR__ . '/includes/footer.php';
    exit;
}

/* Buscar dados principais */
$sqlItem = "
SELECT 
    i.codigo_item,
    i.descricao,
    i.tamanho_nominal,
    i.marca,
    p.etapa_atual,
    p.status_geral
FROM itens_processos p
JOIN cadastros_itens_minimas i ON i.id = p.item_id
WHERE p.id = :id
";

$stmtItem = $pdo->prepare($sqlItem);
$stmtItem->execute([':id' => $processo_id]);
$item = $stmtItem->fetch();

if (!$item) {
    echo "<div class='container'><h2>Processo não encontrado.</h2></div>";
    require_once __DIR__ . '/includes/footer.php';
    exit;
}

/* Buscar histórico */
$sqlLog = "
SELECT area_origem, area_destino, acao, usuario, observacao, data_acao
FROM itens_movimentacoes
WHERE processo_id = :id
ORDER BY data_acao ASC
";

$stmtLog = $pdo->prepare($sqlLog);
$stmtLog->execute([':id' => $processo_id]);
$logs = $stmtLog->fetchAll();
?>

<div class="container">
    <h1>Detalhes do Processo</h1>

    <div class="card" style="margin-bottom:30px;">
        <strong>Código:</strong> <?= e($item['codigo_item']) ?><br>
        <strong>Descrição:</strong> <?= e($item['descricao']) . ' ' . e($item['tamanho_nominal']) ?><br>
        <strong>Marca:</strong> <?= e($item['marca']) ?><br>
        <strong>Etapa Atual:</strong> <?= e($item['etapa_atual']) ?><br>
        <strong>Status Geral:</strong> <?= e($item['status_geral']) ?>
    </div>

    <h2>Histórico</h2>

    <table>
        <tr>
            <th>Área Origem</th>
            <th>Área Destino</th>
            <th>Ação</th>
            <th>Usuário</th>
            <th>Observação</th>
            <th>Data</th>
        </tr>

        <?php foreach ($logs as $log): ?>
        <tr>
            <td><?= e($log['area_origem']) ?></td>
            <td><?= e($log['area_destino']) ?></td>
            <td><?= e($log['acao']) ?></td>
            <td><?= e($log['usuario']) ?></td>
            <td><?= e($log['observacao']) ?></td>
            <td><?= date('d/m/Y H:i', strtotime($log['data_acao'])) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>