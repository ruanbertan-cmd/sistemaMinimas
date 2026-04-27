<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
require_once __DIR__ . '/../config/conexao.php';
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
        i.tamanho_nominal,
        i.marca,
        i.unidade_fabricacao,
        i.numeros_face,

        c.metodo_imagem,
        c.precisa_foto,
        c.qtd_pecas_foto,
        c.precisa_manipulacao,
        c.detalhe_manipulacao,
        c.qtd_pecas_manipulacao,
        c.precisa_video,
        c.qtd_pecas_video,
        c.observacao,

        d.metodo_detec,
        d.observacao_detec,
        d.proxima_etapa,
        d.aprovado_por,
        d.data_aprovacao

    FROM itens_processos p
    INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN processo_comunicacao c ON c.processo_id = p.id
    LEFT JOIN processo_detec d ON d.processo_id = p.id
    WHERE p.id = ?
");

$stmt->execute([$processoId]);
$processo = $stmt->fetch();

if (!$processo) {
    die("Processo não encontrado.");
}
?>

<div class="container">
    <h1>Liberação - Amostra</h1>

    <div class="card">
        <h3>Informações do Item</h3>
        <p><strong>Código:</strong> <?= htmlspecialchars($processo['codigo_item']) ?></p>
        <p><strong>Descrição:</strong> <?= htmlspecialchars($processo['descricao'] . ' ' . $processo['tamanho_nominal'])?></p>
        <p><strong>Marca:</strong> <?= htmlspecialchars($processo['marca']) ?></p>
        <p><strong>Unidade:</strong> <?= htmlspecialchars($processo['unidade_fabricacao']) ?></p>
        <p><strong>Números de Faces:</strong> <?= $processo['numeros_face'] ?></p>
    </div>

    <div class="card">
        <form action="salvar_amostra.php" method="POST">

            <input type="hidden" name="processo_id" value="<?= $processoId ?>">

            <h1>Seguir com processos definidos</h1>
            <div class="form-group">
                <p>Quantidade de peças necessárias:</p>
                    <ul>
                    <?php
                    $metodo = $processo['metodo_imagem'] ?? null;
                    $precisaFoto = !empty($processo['precisa_foto']) && (int)$processo['qtd_pecas_foto'] > 1;
                    $precisaManipulacaoFaces = !empty($processo['precisa_manipulacao']) && (int)$processo['qtd_pecas_manipulacao'] > 0 && $processo['detalhe_manipulacao'] === 'Faces Aleatórias';
                    $precisaVideo = !empty($processo['precisa_video']) && (int)$processo['qtd_pecas_video'] > 0;
                    if ($precisaFoto || $precisaManipulacaoFaces || $precisaVideo):
                        if ($precisaFoto) {
                            echo "<li>Foto Still: {$processo['qtd_pecas_foto']} peças</li>";
                        }
                        if ($precisaManipulacaoFaces) {
                            echo "<li>Manipulação Faces Aleatorias: {$processo['qtd_pecas_manipulacao']} peças</li>";
                        }
                        if ($precisaVideo) {
                            echo "<li>Vídeo: {$processo['qtd_pecas_video']} peças</li>";
                        }
                    endif;
                    ?>
                </ul>
            </div>

            <div class="form-group">
                <label for="metodoAmostra">Procedimento Amostra</label>
                <select name="metodo_amostra" id="metodoAmostra" required>
                    <option value=""></option>
                    <option value="separadoPecas">Ok, Itens separados</option>
                </select>
            </div>

            <div class="form-group">
                 <label for="observacao">Observação:</label>
                 <input type="text" name="observacao_amostra" placeholder="Observação">
            </div>

            <h3>Próxima Etapa</h3>

            <div class="form-group">
                <input type="hidden" name="proxima_etapa_amostra" value="inteligencia_mercado">
                <p>Após clicar em liberar processo, o mesmo seguirá para a etapa de Inteligência de Mercado</p>
            </div>
            <button type="submit">Liberar Processo</button>
        </form>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>