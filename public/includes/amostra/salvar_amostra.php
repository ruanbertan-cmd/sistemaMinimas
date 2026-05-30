<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';

date_default_timezone_set('America/Sao_Paulo');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $metodoAmostra = $_POST['metodo_amostra'] ?? '';
    $observacaoAmostra = $_POST['observacao_amostra'] ?? '';
    $proximaEtapaAmostra = $_POST['proxima_etapa_amostra'] ?? '';

    try {

        $pdo->beginTransaction();

        // Registro info Amostra
        $stmt = $pdo->prepare("
            INSERT INTO SM_processo_amostra
            (processo_id, metodo_amostra, observacao_amostra, proxima_etapa)
            VALUES (?,?,?,?)
        ");

        $stmt->execute([
            $processoId,
            $metodoAmostra,
            $observacaoAmostra,
            $proximaEtapaAmostra
        ]);

        // Salvando fase Atual para Atualizacao Log posteriormente

        $stmtEtapaAtual = $pdo->prepare("
            SELECT etapa_atual
            FROM SM_itens_processos
            WHERE id = ?
        ");
        $stmtEtapaAtual->execute([$processoId]);
        $etapaAtual = $stmtEtapaAtual->fetchColumn();

        // Atualizando etapda do item para a nova
        $stmtupdate = $pdo->prepare("
            UPDATE SM_itens_processos
            SET etapa_atual = ?,
            status_geral = 'em_andamento'
            WHERE id = ?
        ");

        $stmtupdate->execute([
            $proximaEtapaAmostra,
            $processoId
        ]);

        // Salvando log da alteracao de fase

        $stmtLog = $pdo->prepare("
            INSERT INTO SM_itens_movimentacoes
            (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmtLog->execute([
            $processoId,
            $etapaAtual,
            $proximaEtapaAmostra,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoAmostra,
            date('Y-m-d H:i:s')
        ]);

        $pdo->commit();

        header("Location: ../logs/fases.php");
        exit;
    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
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