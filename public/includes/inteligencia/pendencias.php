<?php
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../../../config/conexao.php';

if (!isset($_GET['id'])) {
    die("Processo não informado.");
}

$processoId = (int) $_GET['id'];

// Buscar pendências registradas
$stmt = $pdo->prepare("
    SELECT tipo_pendencia, caminho_arquivo, descricao, status_evidencia
    FROM SM_evidencias_inteligenciaMercado
    WHERE processo_id = ?
");
$stmt->execute([$processoId]);
$pendencias = $stmt->fetchAll();
?>

<div class="container">
    <h1>Tratamento de Pendências</h1>
    <p><strong>Processo:</strong> <?= $processoId ?></p>

    <?php if (empty($pendencias)): ?>
        <div class="alert">Nenhuma pendência registrada para este processo.</div>
    <?php else: ?>
        <?php foreach ($pendencias as $p): ?>
            <div class="card">
                <h3><?= ucfirst(str_replace('_', ' ', $p['tipo_pendencia'])) ?></h3>

                <?php if (empty($p['caminho_arquivo'])): ?>
                    <p><em>Sem evidência registrada</em></p>
                <?php else: ?>
                    <img src="/uploads/evidencias/<?= htmlspecialchars($p['caminho_arquivo']) ?>" width="200">
                <?php endif; ?>

                <p><strong>Descrição:</strong> <?= htmlspecialchars($p['descricao'] ?? 'Sem observação') ?></p>
                <p><strong>Status:</strong> <?= htmlspecialchars($p['status_evidencia']) ?></p>

                <form action="salvar_pendencia.php" method="POST">
                    <input type="hidden" name="processo_id" value="<?= $processoId ?>">
                    <input type="hidden" name="tipo_pendencia" value="<?= $p['tipo_pendencia'] ?>">

                    <label>Comentário da revisão:</label>
                    <textarea name="comentario_validacao" rows="3"></textarea>

                    <label>Encaminhar para:</label>
                    <select name="proxima_etapa" required>
                        <option value=""></option>
                        <option value="detec">Detec</option>
                        <option value="amostra">Amostra</option>
                    </select>

                    <button type="submit" name="acao" value="validar">Validar Pendência</button>
                    <button type="submit" name="acao" value="rejeitar">Rejeitar Pendência</button>

                </form>
           
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

<?php require_once __DIR__ . '/../layout/footer.php'; ?>
