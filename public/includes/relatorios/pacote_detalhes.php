<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';

$pacoteId = (int) $_GET['id'];

// Buscar informações do pacote
$stmtPacote = $pdo->prepare("
    SELECT id, status, data_criacao, data_fechamento, aprovado_por,
           data_agendamento, responsavel_fotografia, data_envio
    FROM SM_pacotes_envio
    WHERE id = ?
");
$stmtPacote->execute([$pacoteId]);
$pacote = $stmtPacote->fetch(PDO::FETCH_ASSOC);

// Buscar itens vinculados
$stmtItens = $pdo->prepare("
    SELECT i.id AS item_id, i.codigo_item, i.descricao, i.tamanho_nominal, i.marca,
           c.metodo_imagem, c.precisa_foto, c.qtd_pecas_foto, c.qtd_pecas_manipulacao, c.precisa_video, c.qtd_pecas_video
    FROM SM_pacote_itens pi
    INNER JOIN SM_itens_processos p ON p.id = pi.processo_id
    INNER JOIN SM_cadastros_itens_minimas i ON i.id = p.item_id
    LEFT JOIN SM_processo_comunicacao c ON c.processo_id = p.id
    WHERE pi.pacote_id = ?
");
$stmtItens->execute([$pacoteId]);
$itens = $stmtItens->fetchAll(PDO::FETCH_ASSOC);


// Buscar info destacada pela comunicacao
$stmtInfoComunicacao = $pdo->prepare("
    SELECT c.metodo_imagem, c.precisa_foto, c.qtd_pecas_foto, 
       c.precisa_manipulacao, c.detalhe_manipulacao, c.qtd_pecas_manipulacao,
       c.precisa_video, c.qtd_pecas_video, c.observacao
FROM SM_processo_comunicacao c
INNER JOIN SM_pacote_itens pi ON pi.processo_id = c.processo_id
WHERE pi.pacote_id = ?
");
$stmtInfoComunicacao->execute([$pacoteId]);
$infoComunicacao = $stmtInfoComunicacao->fetchAll(PDO::FETCH_ASSOC);
?>

<div style="text-align:left; margin-top:90px;">
  <a href="pacote.php" class="btn btn-secondary"><- Voltar</a>
</div>

<div class="container" style="margin-top:-10px;">
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
                <?php elseif (!empty($pacote['data_agendamento'])): ?>
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
            <th>Marca</th>
            <th>Qtd Foto</th>
            <th>Precisa Video</th>
            <th>Qtd Manipulação</th>
            <th>Upload</th>
        </tr>
        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) . " " . htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>

            <!-- Lógica para exibir quantidade de fotos/vídeos com base nas informações do processo_comunicacao -->
            <?php
            $qtdFoto = $item['qtd_pecas_foto'] . " peças"?? 0;
            $qtdVideo = $item['qtd_pecas_video'] . " peças" ?? 0;
            $precisaFoto = $item['precisa_foto'] ? ' (Foto)' : '';
            $precisaVideo = $item['precisa_video'] ? ' (Vídeo)' : '';
            ?>
            <td><?= htmlspecialchars($qtdFoto) ?></td>
            <td><?php if (htmlspecialchars($qtdVideo) > 0): ?>
                    <?= "Sim" ?>
                <?php else: ?>
                    -
                <?php endif; ?>

            <td><?= htmlspecialchars($item['qtd_pecas_manipulacao'] ?? '-') ?></td>
            
            <td>
                <?php if (!empty($item["qtd_pecas_foto"])): ?>

                    <form class="upload-form" action="upload_imagem.php" method="POST" enctype="multipart/form-data">
                         <select name="tipo" id="modeloImagem" required>
                             <option value=""></option>
                             <option value="foto">Foto</option>
                             <option value="video">Video</option>
                             <option value="manipulada">Manipulacao</option>
                         </select>
                    
                         <input type="hidden" name="pacote_id" value="<?= $pacoteId ?>">
                         <input type="hidden" name="item_id" value="<?= htmlspecialchars($item['item_id']) ?>">
                         <input type="file" name="arquivos[]" multiple class="upload-input">
                         <button type="submit" class="upload-btn">Enviar</button>
                    </form>

                <?php else: ?>
                    -
                <?php endif; ?>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>

</div>
?>

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