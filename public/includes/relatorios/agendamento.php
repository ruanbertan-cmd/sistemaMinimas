<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

$pacoteId   = (int) $_POST['pacote_id'];
$dataHora   = $_POST['data_hora'] ?? null;
$responsavel = $_POST['responsavel'] ?? null;
$usuario    = $_SESSION['usuario'] ?? 'comunicacao';

try {
    $pdo->beginTransaction();

    if (!$dataHora || !$responsavel) {
        throw new Exception("Dados de agendamento incompletos.");
    }

    // Atualiza etapa do item
    $stmtupdate = $pdo->prepare("
        UPDATE SM_itens_processos
        SET etapa_atual = 'amostra',
            status_geral = 'agendado'
        WHERE id = ?
    ");
    $stmtupdate->execute([$pacoteId]);

    // Atualiza pacote com data de agendamento e responsável
    $stmt = $pdo->prepare("
        UPDATE SM_pacotes_envio
        SET data_agendamento = ?, responsavel_fotografia = ?
        WHERE id = ?
    ");
    $stmt->execute([$dataHora, $responsavel, $pacoteId]);

    // Atualiza todos os itens vinculados para status 'agendado'
    $stmtItens = $pdo->prepare("
        UPDATE SM_itens_processos
        SET status_geral = 'agendado'
        WHERE id IN (SELECT processo_id FROM SM_pacote_itens WHERE pacote_id = ?)
    ");
    $stmtItens->execute([$pacoteId]);

    // Registrar movimentação
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
        SELECT pi.processo_id, 'comunicacao', 'fotografia', 'agendar_fotografo', ?, ?, NOW()
        FROM SM_pacote_itens pi
        INNER JOIN SM_itens_processos ip ON ip.id = pi.processo_id
        WHERE pi.pacote_id = ?
    ");
    $observacao = "Agendamento realizado para $responsavel em $dataHora";
    $stmtLog->execute([$usuario, $observacao, $pacoteId]);

    $pdo->commit();

    header("Location: pacote.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro ao agendar fotógrafo: " . $e->getMessage());
}
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