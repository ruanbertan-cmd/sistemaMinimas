<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $tipoPendencia = $_POST['tipo_pendencia'];
    $comentario = $_POST['comentario_validacao'];
    $acao = $_POST['acao'];
    $proximaEtapa = $_POST['proxima_etapa'];

    $status = ($acao === 'validar') ? 'validada' : 'rejeitada';

    $stmt = $pdo->prepare("
        UPDATE SM_evidencias_inteligenciaMercado
        SET status_evidencia = ?, comentario_validacao = ?
        WHERE processo_id = ? AND tipo_pendencia = ?
    ");
    $stmt->execute([$status, $comentario, $processoId, $tipoPendencia]);

    $stmtCheck = $pdo->prepare("
        SELECT COUNT(*)
        FROM SM_evidencias_inteligenciaMercado
        WHERE processo_id = ? AND status_evidencia = 'pendente'
    ");
    $stmtCheck->execute([$processoId]);
    $pendentes = $stmtCheck->fetchColumn();

    if ($pendentes == 0) {
        // Atualiza etapa do processo
        $stmtUpdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = ?, status_geral = 'em_andamento'
            WHERE id = ?
        ");
        $stmtUpdate->execute([$proximaEtapa, $processoId]);

        header("Location: pendencias.php?id=$processoId");
        exit;
    } else {
        header("Location: pendencias.php?id=$processoId");
        exit;
    }
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