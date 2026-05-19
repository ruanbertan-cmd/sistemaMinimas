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