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
        c.observacao

    FROM itens_processos p
    INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN processo_comunicacao c ON c.processo_id = p.id
    WHERE p.id = ?
");

$stmt->execute([$processoId]);
$processo = $stmt->fetch();

if (!$processo) {
    die("Processo não encontrado.");
}
?>

<div class="container">
    <h1>Liberação - Detec</h1>

    <div class="card">
        <h3>Informações do Item</h3>
        <p><strong>Código:</strong> <?= htmlspecialchars($processo['codigo_item']) ?></p>
        <p><strong>Descrição:</strong> <?= htmlspecialchars($processo['descricao'] . ' ' . $processo['tamanho_nominal'])?></p>
        <p><strong>Marca:</strong> <?= htmlspecialchars($processo['marca']) ?></p>
        <p><strong>Unidade:</strong> <?= htmlspecialchars($processo['unidade_fabricacao']) ?></p>
        <p><strong>Números de Faces:</strong> <?= $processo['numeros_face'] ?></p>
    </div>

    <div class="card">
        <form action="salvar_detec.php" method="POST">

            <input type="hidden" name="processo_id" value="<?= $processoId ?>">

            <h1>Seguir com a separação dos itens conforme indicado pelo Depto. Comunicação</h1>

            <div class="form-group">
                <p>Quantidade de peças necessárias:</p>
                
                    <ul>

                    <?php 
                    $metodo = $processo['metodo_imagem'] ?? null;

                    // FOTO
                    if (!empty($processo['precisa_foto']) && (int)$processo['qtd_pecas_foto'] > 0):

                        $descricaoFoto = ($metodo === 'totalmenteFotografado')
                            ? 'Faces distintas'
                            : 'Faces aleatórias';

                    ?>
                        <li>
                            Foto: <?= $processo['qtd_pecas_foto'] . ' - ' . $descricaoFoto ?>
                        </li>
                    <?php endif; ?>


                    <?php 
                    // MANIPULAÇÃO
                    if (!empty($processo['precisa_manipulacao']) && (int)$processo['qtd_pecas_manipulacao'] > 0):
                    ?>
                        <li>
                            Manipulação: 
                            <?= $processo['qtd_pecas_manipulacao'] . ' - ' . ($processo['detalhe_manipulacao'] ?? 'Sem detalhe') ?>
                        </li>
                    <?php endif; ?>

                    <?php 
                    // VÍDEO
                    if (!empty($processo['precisa_video']) && (int)$processo['qtd_pecas_video'] > 0):
                    ?>
                        <li>
                            Vídeo: <?= $processo['qtd_pecas_video'] . ' - Peças aleatórias'?>
                        </li>
                    <?php endif; ?>

                    </ul>
            </div>

            <div class="form-group">
                <label for="metodoDetec">Procedimento Detec</label>
                <select name="metodo_detec" id="metodoDetec" required>
                    <option value=""></option>
                    <?php
        
                    $precisaFoto = !empty($processo['precisa_foto']) && (int)$processo['qtd_pecas_foto'] > 1;
                    $precisaManipulacaoFaces = !empty($processo['precisa_manipulacao']) && (int)$processo['qtd_pecas_manipulacao'] > 0 && $processo['detalhe_manipulacao'] === 'Faces Distintas';

                    if ($precisaFoto || $precisaManipulacaoFaces):
                        // Travar: só pode seguir com a opção de peças separadas pelo Detec
                        echo '<option value="separadoDetec">Ok, peças separadas, identificadas e enviadas para a Amostra</option>'; ?>
                    <?php else: ?>
                        <!-- Se não tiver a necessidade de foto ou manipulação com faces distintas, liberar ambas as opções -->
                        <option value="separadoDetec">Ok, peças separadas, identificadas e enviadas para a Amostra</option>
                        <option value="separadoAmostra">Item ja produzido, seguir com separação das mesmas pelo Depto. Amostra</option>
                    <?php endif; ?>
                </select>
            </div>

            <div class="form-group" id="blocoVideo">
                 <label for="observacao">Observação:</label>
                 <input type="text" name="observacao_detec" placeholder="Observação">
            </div>
            </div>
            <div>
                <input type="hidden" name="proxima_etapa" id="proxima_etapa">
            </div>
            <button type="submit">Liberar Processo</button>
        </form>

<script>
//Script para atualizar a próxima etapa automaticamente com base na escolha do procedimento Detec
document.getElementById('metodoDetec').addEventListener('change', function() {
    const etapahidden = document.getElementById('proxima_etapa');
    if (this.value === 'separadoDetec') {
        etapahidden.value = 'inteligencia_mercado';
    } else if (this.value === 'separadoAmostra') {
        etapahidden.value = 'amostra';
    } else {
        etapahidden.value = '';
    }
});
</script>

    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>