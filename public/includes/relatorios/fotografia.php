<?php
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';
require_once __DIR__ . '/../../../config/conexao.php';

$stmt = $pdo->query("
    SELECT 
        p.id AS pacote_id,
        p.status,
        p.data_criacao,
        p.data_fechamento,
        p.aprovado_por,
        p.data_agendamento,
        p.responsavel_fotografia,
        p.data_envio,
        COUNT(pi.id) AS qtd_itens
    FROM pacotes_envio p
    LEFT JOIN pacote_itens pi ON pi.pacote_id = p.id
    GROUP BY p.id
    ORDER BY p.id DESC
");
$pacotes = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="container">
    <h1>Pacotes de Fotografia</h1>
    <table>
        <tr>
            <th>ID Pacote</th>
            <th>Status</th>
            <th>Qtd Itens</th>
            <th>Data Abertura</th>
            <th>Comunicação</th>
            <th>Agendamento Fotógrafo</th>
            <th>Envio de Peças</th>
            <th>Ações</th>
        </tr>
        <?php foreach ($pacotes as $pacote): ?>
        <tr>
            <td><?= $pacote['pacote_id'] ?></td>
            <td><?= ucfirst($pacote['status']) ?></td>
            <td><?= $pacote['qtd_itens'] ?></td>
            <td><?= date('d/m/Y H:i', strtotime($pacote['data_criacao'])) ?></td>

            <!-- Comunicação -->
            <td>
                <?php if ($pacote['status'] === 'aberto'): ?>
                    <form action="aprovar_comunicacao.php" method="POST" style="display:inline;" 
                          onsubmit="return confirm('Tem certeza que deseja aprovar este pacote?');">
                        <input type="hidden" name="pacote_id" value="<?= $pacote['pacote_id'] ?>">
                        <button type="submit" class="btn-liberar">Aprovar</button>
                    </form>
                <?php else: ?>
                    Aprovado em <?= date('d/m/Y H:i', strtotime($pacote['data_fechamento'])) ?>
                <?php endif; ?>
            </td>

            <!-- Agendamento Fotógrafo -->
            <td>
                <?php if (!$pacote['data_agendamento']): ?>
                    <form action="agendar_fotografia.php" method="POST" style="display:inline;" 
                        onsubmit="return confirmarAgendamento(this);">
                        <input type="hidden" name="pacote_id" value="<?= $pacote['pacote_id'] ?>">
                        <input type="datetime-local" name="data_hora" required>
                        <input type="text" name="responsavel" placeholder="Responsável" required>
                        <button type="submit" class="btn-detalhes">Agendar</button>
                    </form>
                <?php else: ?>
                    Agendado em <?= date('d/m/Y H:i', strtotime($pacote['data_agendamento'])) ?> - <?= $pacote['responsavel_fotografia'] ?>
                <?php endif; ?>
            </td>

            <!-- Envio de Peças -->
            <td>
                <?php if (!$pacote['data_envio']): ?>
                    <form action="enviar_pecas.php" method="POST" style="display:inline;" 
                          onsubmit="return confirm('Confirmar envio das peças?');">
                        <input type="hidden" name="pacote_id" value="<?= $pacote['pacote_id'] ?>">
                        <button type="submit" class="btn-detalhes">Enviar</button>
                    </form>
                <?php else: ?>
                    Enviado em <?= date('d/m/Y H:i', strtotime($pacote['data_envio'])) ?>
                <?php endif; ?>
            </td>

            <!-- Ações -->
            <td>
                <a href="pacote_detalhes.php?id=<?= $pacote['pacote_id'] ?>">Ver Itens</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

<script>
function confirmarAgendamento(form) {
    const dataHora = form.querySelector('[name="data_hora"]').value;
    const responsavel = form.querySelector('[name="responsavel"]').value;

    if (!dataHora || !responsavel) {
        alert("Preencha data/hora e responsável antes de confirmar.");
        return false;
    }

    return confirm("Tem certeza que deseja agendar para " + date('d/m/Y H:i', strtotime(dataHora)) + "?");
}
</script>

