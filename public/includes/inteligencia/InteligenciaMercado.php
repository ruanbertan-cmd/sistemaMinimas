<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../helpers/etapas.php';
require_once __DIR__ . '/../../../config/conexao.php';

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
        e.proxima_etapa AS proxima_etapa_amostra,

        f.tipo_pendencia,
        f.caminho_arquivo,
        f.data_registro,
        f.descricao,
        f.status_evidencia,
        f.comentario_validacao

    FROM SM_itens_processos p
    INNER JOIN SM_cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN SM_processo_comunicacao c ON c.processo_id = p.id
    LEFT JOIN SM_processo_detec d ON d.processo_id = p.id
    LEFT JOIN SM_processo_amostra e ON e.processo_id = p.id
    LEFT JOIN SM_evidencias_inteligenciaMercado f ON f.processo_id = p.id
    WHERE p.id = ?
");

$stmt->execute([$processoId]);
$processo = $stmt->fetch();

if (!$processo) {
    die("Processo não encontrado.");
}
?>

<div class="container">
    <h1>Liberação - Inteligência de Mercado</h1>

    <div class="card">
        <h3>Informações do Item</h3>
        <p><strong>Código:</strong> <?= htmlspecialchars($processo['codigo_item']) ?></p>
        <p><strong>Descrição:</strong> <?= htmlspecialchars($processo['descricao'] . ' ' . $processo['tamanho_nominal'])?></p>
        <p><strong>Marca:</strong> <?= htmlspecialchars($processo['marca']) ?></p>
        <p><strong>Unidade:</strong> <?= htmlspecialchars($processo['unidade_fabricacao']) ?></p>
        <p><strong>Números de Faces:</strong> <?= $processo['numeros_face'] ?></p>
    </div>

    <!-- Flex container para dividir em duas colunas -->
    <div style="display:flex; gap:20px;">
        <!-- Validação checagem -->
        <div class="card" style="flex:1;">
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
            </form>
        </div>

        <!-- Histórico de Pendências -->
        <?php if (!empty($processo['tipo_pendencia'])): ?>
        <div class="card" style="flex:1;">
            <h2>Histórico de Pendências</h2>
            <table>
                <tr>
                    <th>Tipo de Pendência</th>
                    <th>Data</th>
                    <th>Status</th>
                    <th>Comentário</th>
                    <th>Ações</th>
                </tr>
                <tr>
                    <td><?= ucfirst(str_replace('_', ' ', $processo['tipo_pendencia'])) ?></td>
                    <td><?= date('d/m/Y H:i', strtotime($processo['data_registro'])) ?></td>
                    <td><?= htmlspecialchars($processo['status_evidencia']) ?></td>
                    <td><?= htmlspecialchars($processo['comentario_validacao']) ?></td>
                    <td>
                        <?php if (!empty($processo['caminho_arquivo'])): ?>
                            <a href="/uploads/evidencias/<?= htmlspecialchars($processo['caminho_arquivo']) ?>" target="_blank">Ver Evidência</a>
                        <?php endif; ?>
                    </td>
                </tr>
            </table>
        </div>
        <?php endif; ?>
    </div>
</div>

<script>
  function toggleFileInput(checkboxId, fileInputId) {
    const checkbox = document.getElementById(checkboxId);
    const fileInput = document.getElementById(fileInputId);

    fileInput.style.display = 'none';

    checkbox.addEventListener('change', function() {
      if (this.checked) {
        fileInput.style.display = 'inline';
      } else {
        fileInput.style.display = 'none';
        fileInput.value = '';
      }
    });
  }

  toggleFileInput('qtd_diferente', 'arquivo_qtd');
  toggleFileInput('qualidade', 'arquivo_qualidade');
  toggleFileInput('identificacao', 'arquivo_identificacao');
</script>

<?php require_once __DIR__ . '/../layout/footer.php'; ?>

<?php
/*// Se não estiver logado, redireciona para a página de validação
else:
    $link = 'http://ww1.eliane.com/sistemaminimas/index.php';
    $link = base64_encode($link);
    #header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    exit;
endif;
?>*/