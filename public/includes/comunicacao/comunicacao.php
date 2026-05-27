<?php
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../helpers/etapas.php';
require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../helpers/voltarEtapas.php';

if (!isset($_GET['id'])) {
    die("Processo não informado.");
}

$processoId = (int) $_GET['id'];

// Se o usuário clicou em "Voltar Etapa"
function etapaAnterior(PDO $pdo, int $processoId) {
    $ordemEtapas = ['comunicacao','detec','amostra','inteligencia_mercado','designers','fotografia'];

    $stmt = $pdo->prepare("SELECT etapa_atual FROM SM_itens_processos WHERE id = ?");
    $stmt->execute([$processoId]);
    $etapaAtual = $stmt->fetchColumn();

    $pos = array_search($etapaAtual, $ordemEtapas);
    if ($pos === false || $pos === 0) {
        return null;
    }
    return $ordemEtapas[$pos - 1];
}

$etapaAnterior = etapaAnterior($pdo, $processoId);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['acao'] ?? '') === 'voltar') {
    try {
        $novaEtapa = voltarEtapa($pdo, $processoId, 'usuarioSistema', 'Voltando etapa por revisão');
        echo "<div class='alert'>Processo voltou para etapa: $novaEtapa</div>";
    } catch (Exception $e) {
        echo "<div class='alert error'>Erro: " . $e->getMessage() . "</div>";
    }
}

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
        i.numeros_face
    FROM SM_itens_processos p
    INNER JOIN SM_cadastros_itens_minimas i ON i.id = p.item_id
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
        <p><strong>Descrição:</strong> <?= htmlspecialchars($processo['descricao'] . ' ' . $processo['tamanho_nominal'])?></p>
        <p><strong>Marca:</strong> <?= htmlspecialchars($processo['marca']) ?></p>
        <p><strong>Unidade:</strong> <?= htmlspecialchars($processo['unidade_fabricacao']) ?></p>
        <p><strong>Números de Faces:</strong> <?= $processo['numeros_face'] ?></p>
    </div>

    <div class="card">
        <form action="salvar_comunicacao.php" method="POST">

            <input type="hidden" name="processo_id" value="<?= $processoId ?>">

            <div class="form-group">
                <label for="metodoImagem">Procedimento Imagem Still</label>
                <select name="metodo_imagem" id="metodoImagem" required>
                    <option value=""></option>
                    <option value="totalmenteFotografado">Totalmente Fotografado</option>
                    <option value="fotografadoManipulado">Fotografado e Manipulado</option>
                    <option value="totalmenteManipulado">Totalmente Manipulado</option>
                </select>
            </div>

            <div class="form-group" id="blocoFoto">
                <label>
                    <input type="checkbox" name="precisa_foto" value="1">
                    Precisa de Foto
                </label>
                <input type="number" name="qtd_pecas_foto" placeholder="Quantidade">
            </div>

            <div class="form-group" id="blocoManipulacao">
                <label>
                    <input type="checkbox" name="precisa_manipulacao" value="1">
                        Precisa de Manipulação
                </label>
                    <select name="detalhe_manipulacao" id="detalheManipulacao">
                        <option value="">Selecione</option>
                        <option value="Faces Distintas">Todas Faces Distintas</option>
                        <option value="Faces Aleatórias">Faces podem ser aleatórias</option>
                    </select>

                <input type="number" name="qtd_pecas_manipulacao" placeholder="Quantidade">
            </div>

            <div class="form-group" id="blocoVideo">
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
                <?= selectEtapas(null, $processo['etapa_atual']) ?>
            </div>
            <button type="submit">Liberar Processo</button>
        </form>
        <form method="POST" onsubmit="return confirmarVoltar()">
            <input type="hidden" name="acao" value="voltar">
            <button type="submit">Voltar Etapa</button>
        </form>

        <script>
        function confirmarVoltar() {
            return confirm("O item vai retornar para a fase <?= $etapaAnterior ?>, tem certeza?");
        }
        </script>
    </div>
</div>

<script>

document.getElementById('blocoFoto').style.display = 'none';
document.getElementById('blocoManipulacao').style.display = 'none';
document.getElementById('blocoVideo').style.display = 'none';

document.getElementById('metodoImagem').addEventListener('change', function() {

    const valor = this.value;

    const blocoFoto = document.getElementById('blocoFoto');
    const blocoManipulacao = document.getElementById('blocoManipulacao');
    const blocoVideo = document.getElementById('blocoVideo');

    // Reset
    blocoFoto.style.display = 'none';
    blocoManipulacao.style.display = 'none';
    blocoVideo.style.display = 'none';

    if (valor === 'totalmenteFotografado') {
        blocoFoto.style.display = 'block';
        blocoVideo.style.display = 'block';
    }

    if (valor === 'totalmenteManipulado') {
        blocoManipulacao.style.display = 'block';
        blocoVideo.style.display = 'block';
    }

    if (valor === 'fotografadoManipulado') {
        blocoFoto.style.display = 'block';
        blocoManipulacao.style.display = 'block';
        blocoVideo.style.display = 'block';
    }

});
</script>

<?php require_once __DIR__ . '/../layout/footer.php'; ?>