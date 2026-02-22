<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
require_once "../config/conexao.php";

$processo_id = $_GET['id'] ?? null;

if (!$processo_id) {
    echo "Processo inválido.";
    exit;
}

$sql = "
SELECT m.area, m.acao, m.usuario, m.data_acao
FROM itens_movimentacoes m
WHERE m.processo_id = :id
ORDER BY m.data_acao ASC
";

$stmt = $pdo->prepare($sql);
$stmt->execute([':id' => $processo_id]);
$logs = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="container">
    <h1>Detalhes do Processo</h1>

    <table>
        <tr>
            <th>Área</th>
            <th>Ação</th>
            <th>Usuário</th>
            <th>Data</th>
        </tr>

        <?php foreach ($logs as $log): ?>
        <tr>
            <td><?= $log['area'] ?></td>
            <td><?= $log['acao'] ?></td>
            <td><?= $log['usuario'] ?></td>
            <td><?= date('d/m/Y H:i', strtotime($log['data_acao'])) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>