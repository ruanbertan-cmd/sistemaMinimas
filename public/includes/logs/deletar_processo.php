<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

date_default_timezone_set('America/Sao_Paulo');

if (!isset($_GET['id'])) {
    die("Processo não informado.");
}

$processoId = (int) $_GET['id'];


try {
    // Atualizar status para cancelado
    $stmt = $pdo->prepare("UPDATE SM_itens_processos SET status_geral = 'cancelado' WHERE id = ?");
    $stmt->execute([$processoId]);

    // Registrar movimentação de cancelamento
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes (processo_id, area_origem, area_destino, acao, usuario, observacao)
        VALUES (?, ?, ?, ?, ?, ?)
    ");
    $stmtLog->execute([
        $processoId,
        'sistema',
        'cancelado',
        'processo_cancelado',
        $_SESSION['usuario'] ?? 'sistema',
        'Processo cancelado manualmente via tela de fases'
    ]);

    header("Location: fases.php");
    exit;
} catch (Exception $e) {
    die("Erro ao cancelar: " . $e->getMessage());
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