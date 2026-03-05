<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
require_once __DIR__ . '/config/conexao.php';
require_once __DIR__ . '/includes/etapas.php';

if (!isset($_GET['id'])) {
    die("Processo não informado.");
}

$processoId = (int) $_GET['id'];

// Buscar dados do processo + item
$stmt = $pdo->prepare("
    SELECT 
        p.id AS processo_id,
        p.etapa_atual,
        p.status_geral,
        i.codigo_item,
        i.descricao,
        i.marca,
        i.unidade_fabricacao,
        i.numeros_face
    FROM itens_processos p
    INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
    WHERE p.id = ?
");

$stmt->execute([$processoId]);
$processo = $stmt->fetch();

if (!$processo) {
    die("Processo não encontrado.");
}
?>

<div class="container">
    <h1>Liberação - Comunicação</h1>

    <div class="card">
        <h3>Informações do Item</h3>
        <p><strong>Código:</strong> <?= htmlspecialchars($processo['codigo_item']) ?></p>
        <p><strong>Descrição:</strong> <?= htmlspecialchars($processo['descricao']) ?></p>
        <p><strong>Marca:</strong> <?= htmlspecialchars($processo['marca']) ?></p>
        <p><strong>Unidade:</strong> <?= htmlspecialchars($processo['unidade_fabricacao']) ?></p>
        <p><strong>Números de Faces:</strong> <?= $processo['numeros_face'] ?></p>
    </div>

    <div class="card">
        <form action="salvar_comunicacao.php" method="POST">

            <input type="hidden" name="processo_id" value="<?= $processoId ?>">

            <h3>Necessidades</h3>

            <div class="form-group">
                <label>
                    <input type="checkbox" name="precisa_foto" value="1">
                    Precisa de Foto
                </label>
                <input type="number" name="qtd_pecas_foto" placeholder="Quantidade">
            </div>

            <div class="form-group">
                <label>
                    <input type="checkbox" name="precisa_video" value="1">
                    Precisa de Vídeo
                </label>
                <input type="number" name="qtd_pecas_video" placeholder="Quantidade"><br><br>

                 <label for="observacao">Observação:</label>
                 <input type="text" name="observacao" placeholder="Observação">
            </div>

            <h3>Próxima Etapa</h3>

            <div class="form-group">
                <?= selectEtapas() ?>
            </div>

            <button type="submit">Liberar Processo</button>
        </form>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>