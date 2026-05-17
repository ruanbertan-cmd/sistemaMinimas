<?php
require_once __DIR__ . '/../../../config/conexao.php';

// Buscar pacotes finalizados
$stmt = $pdo->query("
    SELECT id AS pacote_id, data_criacao, data_fechamento, aprovado_por, data_agendamento, responsavel_fotografia
    FROM pacotes_envio
    WHERE status = 'finalizado'
    ORDER BY id DESC
");
$pacotes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Se formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pacoteId = (int) $_POST['pacote_id'];
    $dataHora = $_POST['data_hora'];
    $responsavel = $_POST['responsavel'];

    $stmtUpdate = $pdo->prepare("
        UPDATE pacotes_envio
        SET data_agendamento = ?, responsavel_fotografia = ?
        WHERE id = ?
    ");
    $stmtUpdate->execute([$dataHora, $responsavel, $pacoteId]);



    // Salvando fase Atual para Atualizacao Log posteriormente
    $stmtEtapaAtual = $pdo->prepare("
        SELECT etapa_atual
        FROM itens_processos
        WHERE id = ?
    ");
    $stmtEtapaAtual->execute([$processoId]);
    $etapaAtual = $stmtEtapaAtual->fetchColumn();
    // Atualizando etapda do item para a nova
    $stmtupdate = $pdo->prepare("
        UPDATE itens_processos
        SET etapa_atual = ?,
        status_geral = 'preparando_envio'
        WHERE id = ?
    ");
    $stmtupdate->execute([
        'preparando_envio',
        $processoId
    ]);
    // Salvando log da alteracao de fase
    $stmtLog = $pdo->prepare("
        INSERT INTO itens_movimentacoes
        (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
        VALUES (?,?,?,?,?,?,?)
    ");
    $stmtLog->execute([
        $processoId,
        $etapaAtual,
        'amostra',
        'aprovar_envio_pecas',
        'usuarioSistema',
        'Aprovando envio das peças separadas na amostra',
        date('Y-m-d H:i:s')
    ]);

    header("Location: agendar_fotografia.php");
    exit;
}
?>

<div class="container">
    <h1>Agendamento de Fotografia</h1>
    <table>
        <tr>
            <th>ID Pacote</th>
            <th>Data Abertura</th>
            <th>Data Fechamento</th>
            <th>Aprovado por</th>
            <th>Agendamento</th>
            <th>Responsável</th>
            <th>Ações</th>
        </tr>
        <?php foreach ($pacotes as $pacote): ?>
        <tr>
            <td><?= $pacote['pacote_id'] ?></td>
            <td><?= date('d/m/Y H:i', strtotime($pacote['data_criacao'])) ?></td>
            <td><?= date('d/m/Y H:i', strtotime($pacote['data_fechamento'])) ?></td>
            <td><?= $pacote['aprovado_por'] ?></td>
            <td><?= $pacote['data_agendamento'] ? date('d/m/Y H:i', strtotime($pacote['data_agendamento'])) : '-' ?></td>
            <td><?= $pacote['responsavel_fotografia'] ?? '-' ?></td>
            <td>
                <?php if (!$pacote['data_agendamento']): ?>
                <form method="POST" style="display:inline;">
                    <input type="hidden" name="pacote_id" value="<?= $pacote['pacote_id'] ?>">
                    <input type="datetime-local" name="data_hora" required>
                    <input type="text" name="responsavel" placeholder="Responsável" required>
                    <button type="submit">Agendar</button>
                </form>
                <?php else: ?>
                    <span class="status aprovado">Agendado</span>
                <?php endif; ?>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
