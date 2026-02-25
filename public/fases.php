<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
require_once __DIR__ . '/config/conexao.php';

$sql = "
SELECT 
    i.id AS item_id,
    i.unidade_fabricacao,
    i.codigo_item,
    i.descricao,
    i.tamanho_nominal,
    i.marca,
    p.id AS processo_id,
    p.etapa_atual,
    p.status_geral
FROM cadastros_itens_minimas i
LEFT JOIN itens_processos p ON p.item_id = i.id
ORDER BY i.id DESC
";
$stmt = $pdo->query($sql);
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);


?>

<div class="container">
    <h1>Fases do Processo</h1>

    <table>
        <tr>
            <th>Uni. Fabril</th>
            <th>Código</th>
            <th>Descrição</th>
            <th>Marca</th>
            <th>Etapa Atual</th>
            <th>Status Geral</th>
            <th>Detalhes</th>
        </tr>

        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['unidade_fabricacao']) ?></td>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) . ' ' . htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>

            <td>
                <span class="status andamento">
                    <?= htmlspecialchars($item['etapa_atual'] ?? 'Inteligência Mercado') ?>
                </span>
            </td>

            <td>
                <?php
                    $status = $item['status_geral'] ?? 'pendente';
                    $classe = match($status) {
                        'finalizado' => 'aprovado',
                        'em_andamento' => 'andamento',
                        'reprovado' => 'reprovado',
                        default => 'pendente'
                    };
                ?>
                <span class="status <?= $classe ?>">
                    <?= ucfirst(str_replace('_', ' ', $status)) ?>
                </span>
            </td>

            <td>
                <?php if (!empty($item['processo_id'])): ?>
                    <a class="btn-detalhes"
                        href="detalhes.php?id=<?= urlencode($item['processo_id']) ?>">
                        Ver Detalhes
                    </a>
                <?php else: ?>
                    <span class="status pendente">Sem Processo</span>
                <?php endif; ?>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>