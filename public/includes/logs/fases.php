<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

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
FROM SM_cadastros_itens_minimas i
LEFT JOIN SM_itens_processos p ON p.item_id = i.id
LEFT JOIN SM_pacote_itens pi ON pi.processo_id = p.id
LEFT JOIN SM_pacotes_envio pe ON pe.id = pi.pacote_id
ORDER BY i.id DESC
";
$stmt = $pdo->query($sql);
$itens = $stmt->fetchAll(PDO::FETCH_ASSOC);


?>

<div class="container">
    <h1>Fases do Processo</h1>

    <table class="tabela-itens">
        <tr>
            <th>Uni. Fabril</th>
            <th>Código</th>
            <th>Descrição</th>
            <th>Marca</th>
            <th>Etapa Atual</th>
            <th>Status Geral</th>
            <th>Liberar Etapa</th>
            <th>Detalhes</th>
        </tr>

        <?php foreach ($itens as $item): ?>
        <tr>
            <td><?php if ($item['unidade_fabricacao'] === 'SCINDOUT' || $item['unidade_fabricacao'] === 'SCOUT.INTERN' || $item['unidade_fabricacao'] === 'SCOUT.NACIONAL' || $item['unidade_fabricacao'] === 'OUT.VINILICOSC'): ?>
                <?= "OUTSOURCING" ?>
            <?php else: ?>
                <?= htmlspecialchars($item['unidade_fabricacao']) ?>
            <?php endif; ?></td>
            <td><?= htmlspecialchars($item['codigo_item']) ?></td>
            <td><?= htmlspecialchars($item['descricao']) . ' ' . htmlspecialchars($item['tamanho_nominal']) ?></td>
            <td><?= htmlspecialchars($item['marca']) ?></td>

            <td>
                <span class="status andamento">
                    <?php switch ($item['etapa_atual']) {
                        case 'comunicacao':
                            echo 'Comunicação';
                            break;
                        case 'detec':
                            echo 'Detec';
                            break;
                        case 'amostra':
                            echo 'Amostra';
                            break;
                        case 'fotografo':
                            echo 'Fotografia';
                            break;
                        case 'inteligencia_mercado':
                            echo 'Inteligência de Mercado';
                            break;
                        case 'design':
                            echo 'Design';
                            break;
                        case 'detec_retrabalho':
                            echo 'Detec';
                            break;
                        default:
                            echo ucfirst(str_replace('_', ' ', $item['etapa_atual'] ?? 'Pendente'));
                    }
                    ?>
            </td>

            <td>
                <?php
                    $status = $item['status_geral'] ?? 'pendente';
                    $classe = match($status) {
                        'finalizado' => 'aprovado',
                        'em_andamento' => 'andamento',
                        'reprovado' => 'reprovado',
                        'cancelado' => 'cancelado',
                        default => 'pendente'
                    };
                ?>
                <span class="status <?= $classe ?>">
                    <?= ucfirst(str_replace('_', ' ', $status)) ?>
                </span>
            </td>

            <td>
                <?php if (!empty($item['processo_id'])): ?>

                <?php
                $paginaEtapa = match ($item['etapa_atual']) {
                    'comunicacao' => '/../includes/comunicacao/comunicacao.php',
                    'detec' => '/../includes/detec/detec.php',
                    'amostra' => '/../includes/amostra/amostra.php',
                    'fotografo' => '/../includes/relatorios/pacote.php',
                    'inteligencia_mercado' => '/../includes/inteligencia/inteligenciaMercado.php',
                    'design' => '/../includes/designers/designers.php',
                    'detec_retrabalho' => '/../includes/inteligencia/pendencias.php'
                };
                ?>
            
                <!-- Botão Liberar -->
                <?php if (!empty($item['processo_id']) 
                        && $item['status_geral'] !== 'cancelado'
                        && $item['status_geral'] !== 'finalizado'
                        && $item['status_geral'] !== 'preparando_envio'
                        && $item['status_geral'] !== 'agendado'
                        && $item['etapa_atual'] !== 'fotografo' 
                        && $item['etapa_atual'] !== 'design' 
                        && $item['status_geral'] !== 'enviado'): ?>

                    <a class="btn-liberar"
                    href="<?= $paginaEtapa ?>?id=<?= urlencode($item['processo_id']) ?>">
                    Liberar
                    </a>

                <?php elseif (!empty($item['processo_id']) 
                            && !empty($item['data_envio'])
                            && $item['status_geral'] === 'enviado'): ?>

                    <span class="status-ok">
                        Enviado em <?= $item['data_envio'] 
                            ? date('d/m/Y H:i', strtotime($item['data_envio'])) 
                            : '-' ?>
                    </span>

                <?php endif; ?>


                <!-- Botão Deletar -->
                 <?php if (!empty($item['processo_id'])
                        && $item['status_geral'] !== 'cancelado'
                        && $item['status_geral'] !== 'finalizado'
                        && $item['status_geral'] !== 'preparando_envio'
                        && $item['status_geral'] !== 'agendado'
                        && $item['etapa_atual'] !== 'fotografo'
                        && $item['etapa_atual'] !== 'design'
                        && $item['status_geral'] !== 'enviado'): ?>
                    <a class="btn-deletar"
                    href="deletar_processo.php?id=<?= urlencode($item['processo_id']) ?>"
                    onclick="return confirm('Tem certeza que deseja deletar este item?');">
                    Deletar
                    </a>
                <?php endif; ?>
            </td>

            <td>
                <?php if (!empty($item['processo_id'])): ?>
                <a class="btn-detalhes"
                href="detalhes.php?id=<?= urlencode($item['processo_id']) ?>">
                Ver Detalhes
                </a>
            </td>
            <?php else: ?>
            <span class="status pendente">Sem Processo</span>
            <?php endif; ?>
            <?php endif; ?>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

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