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

    FROM SM_itens_processos p
    INNER JOIN SM_cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN SM_processo_comunicacao c ON c.processo_id = p.id
    LEFT JOIN SM_processo_detec d ON d.processo_id = p.id
    LEFT JOIN SM_processo_amostra e ON e.processo_id = p.id
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
        <form action="salvar_inteligenciaMercado.php" method="POST" enctype="multipart/form-data">

            <input type="hidden" name="processo_id" value="<?= $processoId ?>">

            <h1>Validação checagem dos produtos</h1>

            <div class="form-group" id="blocoChecagem">
                Produto não encontrado
                <label>
                    <input type="checkbox" id="pecas_separadas" name="pecas_separadas" value="1">
                </label>

                Quantidade diferente do solicitado
                <label>
                    <input type="checkbox" id="qtd_diferente" name="qtd_diferente" value="1">
                    <input type="file" id="arquivo_qtd" name="arquivo_qtd" accept="image/*" style="display:none;">
                </label>

                Defeito na peça (Lascado, amassado, risco, etc)
                <label>
                    <input type="checkbox" id="qualidade" name="qualidade" value="1">
                    <input type="file" id="arquivo_qualidade" name="arquivo_qualidade" accept="image/*" style="display:none;">
                </label>
                
                Falta de Identificação (Nome do produto na peça)
                <label>
                    <input type="checkbox" id="identificacao" name="identificacao" value="1">
                    <input type="file" id="arquivo_identificacao" name="arquivo_identificacao" accept="image/*" style="display:none;">
                </label>

            </div>

            <div class="form-group">
                 <label for="observacao">Observação:</label>
                 <input type="text" name="observacao_inteligenciaMercado" placeholder="Observação">
            </div>

            <h3>Próxima Etapa</h3>

            <div class="form-group">
                <?= selectEtapas(null, $processo['etapa_atual']) ?>
            </div>
            <button type="submit">Liberar Processo</button>
        </form><br>
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
  function toggleFileInput(checkboxId, fileInputId) {
    const checkbox = document.getElementById(checkboxId);
    const fileInput = document.getElementById(fileInputId);

    // Estado inicial: escondido
    fileInput.style.display = 'none';

    checkbox.addEventListener('change', function() {
      if (this.checked) {
        fileInput.style.display = 'inline';
      } else {
        fileInput.style.display = 'none';
        fileInput.value = ''; // limpa arquivo selecionado
      }
    });
  }

  // Ativa para cada par
  toggleFileInput('qtd_diferente', 'arquivo_qtd');
  toggleFileInput('qualidade', 'arquivo_qualidade');
  toggleFileInput('identificacao', 'arquivo_identificacao');
</script>


<?php require_once __DIR__ . '/../layout/footer.php'; ?>

