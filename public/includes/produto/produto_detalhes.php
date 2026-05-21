<?php
require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';

$itemId = (int) $_GET['item_id'];

$stmt = $pdo->prepare("
    SELECT id, caminho_arquivo, tipo, status
    FROM item_imagens
    WHERE item_id = ?
    ORDER BY tipo, id
");
$stmt->execute([$itemId]);
$arquivos = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Agrupar por tipo
$fotos = array_filter($arquivos, fn($a) => $a['tipo'] === 'foto');
$manipulacoes = array_filter($arquivos, fn($a) => $a['tipo'] === 'manipulacao');
$videos = array_filter($arquivos, fn($a) => $a['tipo'] === 'video');
?>

<div style="text-align:left; margin-top:90px;">
  <a href="produto.php" class="btn btn-secondary"><- Voltar</a>
</div>

<h2>Detalhes do Item</h2>

<!-- Modal para ampliar imagem -->
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 9999;
  padding-top: 60px;
  left: 0; top: 0;
  width: 100%; height: 100%;
  overflow: auto;
  background-color: rgba(0,0,0,0.9);
}
.modal-content {
  margin: auto;
  display: block;
  max-width: 90%;
  max-height: 90%;
}
.close {
  position: absolute;
  top: 20px; right: 35px;
  color: #fff;
  font-size: 40px;
  font-weight: bold;
  cursor: pointer;
}
</style>

<div id="imgModal" class="modal" onclick="closeModal()">
  <span class="close" onclick="closeModal()">&times;</span>
  <img class="modal-content" id="modalImg">
</div>

<script>
function openModal(src) {
  document.getElementById("imgModal").style.display = "block";
  document.getElementById("modalImg").src = src;
}
function closeModal() {
  document.getElementById("imgModal").style.display = "none";
}
</script>

<table class="tabela-itens" style="margin-top:20px;">
    <tr>
        <th>Fotos</th>
        <th>Manipulação</th>
        <th>Vídeos</th>
    </tr>
    <tr>
        <!-- Fotos -->
        <td>
            <?php foreach ($fotos as $foto): ?>
                <div style="margin:10px;">
                    <img src="../relatorios/uploads/<?= htmlspecialchars($foto['caminho_arquivo']) ?>" 
                         alt="Foto" style="max-width:150px; max-height:150px; border:1px solid #ccc; cursor:pointer;"
                         onclick="openModal('../relatorios/uploads/<?= htmlspecialchars($foto['caminho_arquivo']) ?>')">
                    <div>Status:
                        <?php switch($foto['status']): case 'pendente': echo 'Pendente'; break; case 'aprovado': echo 'Aprovado'; break; case 'rejeitado': echo 'Rejeitado'; break; endswitch; ?>
                    </div>
                    <form action="aprovar_imagem.php" method="POST">
                        <input type="hidden" name="imagem_id" value="<?= $foto['id'] ?>">
                        <?php if ($foto['status'] === 'pendente'): ?>
                            <button type="submit" name="acao" value="aprovado">Aprovar</button>
                            <button type="submit" name="acao" value="rejeitado">Rejeitar</button>
                        <?php endif; ?>
                    </form>
                </div>
            <?php endforeach; ?>
        </td>

        <!-- Manipulações -->
        <td>
            <?php foreach ($manipulacoes as $manip): ?>
                <div style="margin:10px;">
                    <img src="../relatorios/uploads/<?= htmlspecialchars($manip['caminho_arquivo']) ?>" 
                         alt="Manipulação" style="max-width:150px; max-height:150px; border:1px solid #ccc; cursor:pointer;"
                         onclick="openModal('../relatorios/uploads/<?= htmlspecialchars($manip['caminho_arquivo']) ?>')">
                    <div>Status:
                        <?php switch($manip['status']): case 'pendente': echo 'Pendente'; break; case 'aprovado': echo 'Aprovado'; break; case 'rejeitado': echo 'Rejeitado'; break; endswitch; ?>
                    </div>
                    <form action="aprovar_imagem.php" method="POST">
                        <input type="hidden" name="imagem_id" value="<?= $manip['id'] ?>">
                        <?php if ($manip['status'] === 'pendente'): ?>
                            <button type="submit" name="acao" value="aprovado">Aprovar</button>
                            <button type="submit" name="acao" value="rejeitado">Rejeitar</button>
                        <?php endif; ?>
                    </form>
                </div>
            <?php endforeach; ?>
        </td>

        <!-- Vídeos -->
        <td>
            <?php foreach ($videos as $video): ?>
                <div style="margin:10px;">
                    <video width="200" controls>
                        <source src="../relatorios/uploads/<?= htmlspecialchars($video['caminho_arquivo']) ?>" type="video/mp4">
                        Seu navegador não suporta vídeo.
                    </video>
                    <div>Status:
                        <?php switch($video['status']): case 'pendente': echo 'Pendente'; break; case 'aprovado': echo 'Aprovado'; break; case 'rejeitado': echo 'Rejeitado'; break; endswitch; ?>
                    </div>
                    <form action="aprovar_imagem.php" method="POST">
                        <input type="hidden" name="imagem_id" value="<?= $video['id'] ?>">
                        <button type="submit" name="acao" value="aprovado">Aprovar</button>
                        <button type="submit" name="acao" value="rejeitado">Rejeitar</button>
                    </form>
                </div>
            <?php endforeach; ?>
        </td>
    </tr>
</table>
<?php require_once __DIR__ . '/../layout/footer.php'; ?>