<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

$pacoteId = (int) $_POST['pacote_id'];
$usuario = $_SESSION['usuario'] ?? 'amostra';

try {
    $pdo->beginTransaction();

    // Atualiza pacote com data de envio
    $stmt = $pdo->prepare("
        UPDATE SM_pacotes_envio
        SET data_envio = NOW()
        WHERE id = ?
    ");
    $stmt->execute([$pacoteId]);

    // Atualiza todos os itens vinculados para status 'enviado' e data que o processo foi finalizado
    $stmtItens = $pdo->prepare("
        UPDATE SM_itens_processos
        SET status_geral = 'enviado', finalizado = NOW()
        WHERE id IN (SELECT processo_id FROM SM_pacote_itens WHERE pacote_id = ?)
    ");
    $stmtItens->execute([$pacoteId]);

    // Registrar movimentação
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes (processo_id, area_origem, area_destino, acao, usuario, observacao)
        SELECT processo_id, 'fotografo', 'amostra', 'envio_pecas', ?, 'Peças enviadas'
        FROM SM_pacote_itens
        WHERE pacote_id = ?
    ");
    $stmtLog->execute([$usuario, $pacoteId]);

    $pdo->commit();

    header("Location: fotografo.php");
    exit;
} catch (Exception $e) {
    $pdo->rollBack();
    die("Erro ao enviar peças: " . $e->getMessage());
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