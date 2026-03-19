<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
require_once __DIR__ . '/config/conexao.php';
require_once __DIR__ . '/includes/etapas.php';

// Buscar dados do processo + item
$stmt = $pdo->query("
    SELECT 
        etapa_atual,
        COUNT(*) as total
    FROM itens_processos
    WHERE status_geral = 'em_andamento'
    GROUP BY etapa_atual
");

$stmtFinalizados = $pdo->query("
    SELECT COUNT(*) FROM itens_processos
    WHERE status_geral = 'finalizado'
");

$totalFinalizados = $stmtFinalizados->fetchColumn();

$dados = $stmt->fetchAll(PDO::FETCH_ASSOC);

$contagem = [];

foreach ($dados as $linha) {
    $contagem[$linha['etapa_atual']] = $linha['total'];
}
?>

<div class="container">
    <h1>Dashboard - Sistema de Mínimas</h1>
    <h2>Resumo das Pendências por Etapas</h2><br>

    <div class="cards">
        <div class="card">
                <h3>Inteligência de Mercado</h3>
            <div class="numero">
                <?= $contagem['inteligencia_de_mercado'] ?? 0 ?>
            </div>
        </div>

        <div class="card">
                <h3>Comunicação</h3>
            <div class="numero">
                <?= $contagem['comunicacao'] ?? 0 ?>
            </div>
        </div>

        <div class="card">
            <h3>Detec</h3>
        <div class="numero">
            <?= $contagem['detec'] ?? 0 ?>
            </div>
        </div>

        <div class="card">
            <h3>Amostra</h3>
            <div class="numero">
                <?= $contagem['amostra'] ?? 0 ?>
            </div>
        </div>

        <div class="card">
            <h3>Fotografia</h3>
            <div class="numero">
                <?= $contagem['fotografia'] ?? 0 ?>
            </div>
        </div>

        <div class="card">
            <h3>Total Finalizados</h3>
            <div class="numero">
                <?= $totalFinalizados ?? 0 ?>
            </div>
        </div>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>