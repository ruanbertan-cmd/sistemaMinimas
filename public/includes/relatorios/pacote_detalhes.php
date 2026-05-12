<?php
require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';

$pacoteId = (int) $_GET['id'];

// Buscar informações do pacote
$stmtPacote = $pdo->prepare("
    SELECT id, status, data_criacao, data_fechamento, aprovado_por,
           data_agendamento, responsavel_fotografia, data_envio
    FROM pacotes_envio
    WHERE id = ?
");
$stmtPacote->execute([$pacoteId]);
$pacote = $stmtPacote->fetch(PDO::FETCH_ASSOC);

// Buscar itens vinculados
$stmtItens = $pdo->prepare("
    SELECT i.codigo_item, i.descricao, i.tamanho_nominal, i.marca
    FROM pacote_itens pi
    INNER JOIN itens_processos p ON p.id = pi.processo_id
    INNER JOIN cadastros_itens_minimas i ON i.id = p.item_id
    WHERE pi.pacote_id = ?
");
$stmtItens->execute([$pacoteId]);
$itens = $stmtItens->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="container">
    <h1>Detalhes do Pacote #<?= $pacoteId ?></h1>

    <table class="tabela-status">
        <tr>
            <th>Comunicação</th>
            <th>Agendamento Fotógrafo</th>
            <th>Envio de Peças</th>
        </tr>
        <tr>
        <tr>
            <!-- Comunicação -->
            <td>
                <?php if ($pacote['status'] === 'aberto'): ?>
                    <form action="aprovar_comunicacao.php" method="POST" 
                        onsubmit="return confirm('Aprovar este pacote?');">
                        <input type="hidden" name="pacote_id" value="<?= $pacoteId ?>">
                        <button type="submit" class="btn-liberar">Aprovar</button>
                    </form>
                <?php else: ?>
                    <span class="status aprovado">
                        Aprovado em <?= $pacote['data_fechamento'] 
                            ? date('d/m/Y H:i', strtotime($pacote['data_fechamento'])) 
                            : '-' ?>
                    </span>
                <?php endif; ?>
            </td>

            <!-- Agendamento Fotógrafo -->
            <td>
                <?php if ($pacote['status'] === 'aberto'): ?>
                    <span class="status pendente">Aguardando Comunicação</span>
                <?php elseif ($pacote['data_agendamento']): ?>
                    <span class="status andamento">
                        <?= date('d/m/Y H:i', strtotime($pacote['data_agendamento'])) ?>
                        - <?= htmlspecialchars($pacote['responsavel_fotografia']) ?>
                    </span>
                <?php else: ?>
                    <form action="agendar_fotografia.php" method="POST" 
                        onsubmit="return confirm('Confirmar agendamento do fotógrafo?');">
                        <input type="hidden" name="pacote_id" value="<?= $pacoteId ?>">
                        <input type="datetime-local" name="data_hora" required>
                        <input type="text" name="responsavel" placeholder="Responsável" required>
                        <button type="submit" class="btn-detalhes">Agendar</button>
                    </form>
                <?php endif; ?>
            </td>

            <!-- Envio de Peças -->
            <td>
                <?php if (!$pacote['data_agendamento']): ?>
                    <span class="status pendente">Aguardando Fotógrafo</span>
                <?php elseif (!$pacote['data_envio']): ?>
                    <form action="enviar_pecas.php" method="POST" 
                        onsubmit="return confirm('Confirmar envio das peças?');">
                        <input type="hidden" name="pacote_id" value="<?= $pacoteId ?>">
                        <button type="submit" class="btn-detalhes">Enviar</button>
                    </form>
                <?php else: ?>
                    <span class="status enviado">
                        Enviado em <?= date('d/m/Y H:i', strtotime($pacote['data_envio'])) ?>
                    </span>
                <?php endif; ?>
            </td>
        </tr>

    <h2>Itens do Pacote</h2>
    <table class="tabela-itens">
        <tr>
            <th>Código</th>
            <th>Descrição</th>
            <th>Dimensão</th>
            <th>Marca</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) ?></td>
            <td><?= htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>
