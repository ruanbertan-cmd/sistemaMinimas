<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

$pacoteId = (int) $_POST['pacote_id'];
$usuario  = $_SESSION['usuario'] ?? 'comunicacao';

try {
    $pdo->beginTransaction();

    // Atualiza pacote para finalizado
    $stmt = $pdo->prepare("
        UPDATE SM_pacotes_envio
        SET status = 'finalizado',
            data_fechamento = NOW(),
            aprovado_por = ?
        WHERE id = ?
    ");
    $stmt->execute([$usuario, $pacoteId]);

    // Atualiza todos os itens vinculados
    $stmtItens = $pdo->prepare("
        UPDATE SM_itens_processos
        SET status_geral = 'preparando_envio'
        WHERE id IN (SELECT processo_id FROM SM_pacote_itens WHERE pacote_id = ?)
    ");
    $stmtItens->execute([$pacoteId]);

    // Buscar um processo vinculado ao pacote
    $stmtProc = $pdo->prepare("
        SELECT processo_id
        FROM SM_pacote_itens
        WHERE pacote_id = ?
        LIMIT 1
    ");
    $stmtProc->execute([$pacoteId]);
    $processoId = $stmtProc->fetchColumn();

    if (!$processoId) {
        throw new Exception("Processo não encontrado para o pacote informado.");
    }

    // Etapa atual
    $stmtEtapaAtual = $pdo->prepare("SELECT etapa_atual FROM SM_itens_processos WHERE id = ?");
    $stmtEtapaAtual->execute([$processoId]);
    $etapaAtual = $stmtEtapaAtual->fetchColumn();

    // Atualiza etapa do item
    $stmtupdate = $pdo->prepare("
        UPDATE SM_itens_processos
        SET etapa_atual = 'fotografia',
            status_geral = 'em_andamento'
        WHERE id = ?
    ");
    $stmtupdate->execute([$processoId]);

    // Log
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes
        (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
        VALUES (?,?,?,?,?,?,?)
    ");
    $stmtLog->execute([
        $processoId,
        $etapaAtual,
        'fotografia',
        'aprovar_envio_pecas',
        $usuario,
        'Aprovando envio das peças separadas na amostra',
        date('Y-m-d H:i:s')
    ]);

    $pdo->commit();

    header("Location: pacote.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro: " . $e->getMessage());
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