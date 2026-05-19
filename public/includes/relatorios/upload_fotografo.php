<?php
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../../../config/conexao.php';

$sql = "
SELECT 
    i.id AS item_id,
    i.unidade_fabricacao,
    i.codigo_item,
    i.descricao,
    i.tamanho_nominal,
    i.marca,
    p.id AS processo_id,
    p.etapa_atual,
    p.status_geral,
    pe.data_envio
FROM cadastros_itens_minimas i
LEFT JOIN itens_processos p ON p.item_id = i.id
LEFT JOIN pacote_itens pi ON pi.processo_id = p.id
LEFT JOIN pacotes_envio pe ON pe.id = pi.pacote_id
ORDER BY i.id DESC
";
$stmt = $pdo->query($sql);
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);


?>
<a href="pacote.php" class="btn btn-secondary" style="margin-top:90px;"><- Voltar</a>

<div class="container" style="margin-top:-10px;">
    <h1>Fases do Processo</h1>

    <p >Anexar fotos do processo para o fotógrafo responsável. Selecione o processo e envie as fotos necessárias para a etapa de fotografia. Certifique-se de seguir as orientações de quantidade e qualidade das fotos para garantir um processo eficiente.</p><br>

    <label>Anexar as fotos realizadas do produto:
        <input type="file" name="foto_processo" id="foto_processo" multiple>
    </label>
<br><br>
    <label>Anexar os vídeos realizados do produto:
        <input type="file" name="video_processo" id="video_processo" multiple>
    </label>

</div>