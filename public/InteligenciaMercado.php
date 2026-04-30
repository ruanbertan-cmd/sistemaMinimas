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
        d.data_aprovacao,

        e.metodo_amostra,
        e.observacao_amostra,
        e.proxima_etapa AS proxima_etapa_amostra

    FROM itens_processos p
    INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN processo_comunicacao c ON c.processo_id = p.id
    LEFT JOIN processo_detec d ON d.processo_id = p.id
    LEFT JOIN processo_amostra e ON e.processo_id = p.id
    WHERE p.id = ?
");

$stmt->execute([$processoId]);
$processo = $stmt->fetch();

if (!$processo) {
    die("Processo não encontrado.");
}
?>

<div class="container">
    <h1>Liberação - Inteligencia de Mercado</h1>

    <div class="card">
        <h3>Informações do Item</h3>
        <p><strong>Código:</strong> <?= htmlspecialchars($processo['codigo_item']) ?></p>
        <p><strong>Descrição:</strong> <?= htmlspecialchars($processo['descricao'] . ' ' . $processo['tamanho_nominal'])?>
        <p><strong>Marca:</strong> <?= htmlspecialchars($processo['marca']) ?></p>
        <p><strong>Unidade:</strong> <?= htmlspecialchars($processo['unidade_fabricacao']) ?></p>
        <p><strong>Números de Faces:</strong> <?= $processo['numeros_face'] ?></p>
    </div>

    <div class="card">
        <form action="salvar_inteligenciaMercado.php" method="POST">

            <input type="hidden" name="processo_id" value="<?= $processoId ?>">

            <h1>Validação checagem dos produtos</h1>

            <div class="form-group" id="blocoChecagem">
                Produto encontrado na amostra?
                <label>
                    <input type="checkbox" name="pecas_separadas" value="1">
                </label>

                Quantidade de acordo com o solicitado?
                <label>
                    <input type="checkbox" name="qtd_de_acordo" value="1">
                </label>

                Qualidade de acordo com o esperado (Sem lascas ou arranhados no desenho)?
                <label>
                    <input type="checkbox" name="qualidade" value="1">
                </label>
                
                Identificação correta (Nome dos produtos escrito nas peças)?
                <label>
                    <input type="checkbox" name="identificacao" value="1">
                </label>

            </div>

            <div class="form-group">
                 <label for="observacao">Observação:</label>
                 <input type="text" name="observacao_inteligenciaMercado" placeholder="Observação">
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