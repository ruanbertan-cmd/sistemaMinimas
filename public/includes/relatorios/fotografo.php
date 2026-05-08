<?php
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../helpers/etapas.php';
require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../helpers/voltarEtapas.php';

date_default_timezone_set('America/Sao_Paulo');

$stmt = $pdo->query("
SELECT 
    p.id AS processo_id,
    i.codigo_item,
    i.descricao,
    i.tamanho_nominal,
    i.marca,
    i.unidade_fabricacao,
    i.numeros_face,
    c.qtd_pecas_foto,
    c.qtd_pecas_video
FROM itens_processos p
INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
LEFT JOIN processo_comunicacao c ON c.processo_id = p.id
WHERE p.etapa_atual = 'fotografia'
ORDER BY p.id DESC;
");
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="container">
    <h1>Itens Aprovados pela Inteligência de Mercado - Prontos para Fotografia</h1>
    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Dimensão</th>
            <th>Marca</th>
            <th>Quantidades</th>
            <th>Total</th>
            <th>Ações</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) ?></td>
            <td><?= htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>
            <td>Foto: <?= htmlspecialchars($item['qtd_pecas_foto']) ?>  Vídeo: <?= htmlspecialchars($item['qtd_pecas_video']) ?></td>
            <td>Total: <?php
            if ($item['qtd_pecas_foto'] > $item['qtd_pecas_video']) {
                echo $item['qtd_pecas_foto'];
            } else if ($item['qtd_pecas_video'] > $item['qtd_pecas_foto']) {
                echo $item['qtd_pecas_video'];
            } else {
                echo $item['qtd_pecas_foto']; // ou $item['qtd_pecas_video'], ambos são iguais
            }
            
            ?></td>

            <td>
                <!-- Botão para gerar pacote -->
                <form action="gerar_pacote.php" method="POST" style="display:inline;">
                    <input type="hidden" name="processo_id" value="<?= $item['processo_id'] ?>">
                    <button type="submit">Gerar Pacote</button>
                </form>

                <!-- Botão para enviar ao fotógrafo -->
                <form action="enviar_fotografo.php" method="POST" style="display:inline;">
                    <input type="hidden" name="processo_id" value="<?= $item['processo_id'] ?>">
                    <button type="submit">Enviar ao Fotógrafo</button>
                </form>

                <!-- Botão para exportar lista -->
                <form action="exportar_lista.php" method="POST" style="display:inline;">
                    <input type="hidden" name="processo_id" value="<?= $item['processo_id'] ?>">
                    <button type="submit">Exportar</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
