<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

date_default_timezone_set('America/Sao_Paulo');

function voltarEtapa(PDO $pdo, int $processoId, string $usuario, string $observacao = '') {
    // Definir ordem das etapas
    $ordemEtapas = [
        'comunicacao',
        'detec',
        'amostra',
        'inteligencia_mercado',
        'designers',
        'fotografia'
    ];

    // Buscar etapa atual
    $stmt = $pdo->prepare("SELECT etapa_atual FROM SM_itens_processos WHERE id = ?");
    $stmt->execute([$processoId]);
    $etapaAtual = $stmt->fetchColumn();

    if (!$etapaAtual) {
        throw new Exception("Processo não encontrado.");
    }

    // Descobrir etapa anterior
    $pos = array_search($etapaAtual, $ordemEtapas);
    if ($pos === false || $pos === 0) {
        throw new Exception("Não é possível voltar etapa.");
    }
    $etapaAnterior = $ordemEtapas[$pos - 1];

    // Atualizar etapa
    $pdo->beginTransaction();
    $stmtUpdate = $pdo->prepare("
        UPDATE SM_itens_processos
        SET etapa_atual = ?, status_geral = 'em_andamento'
        WHERE id = ?
    ");
    $stmtUpdate->execute([$etapaAnterior, $processoId]);

    // Registrar log
    $stmtLog = $pdo->prepare("
        INSERT INTO SM_itens_movimentacoes
        (processo_id, area_origem, area_destino, acao, usuario, observacao)
        VALUES (?,?,?,?,?,?)
    ");
    $stmtLog->execute([
        $processoId,
        $etapaAtual,
        $etapaAnterior,
        'retrocesso_etapa',
        $usuario,
        $observacao
    ]);

    $pdo->commit();

    return $etapaAnterior;
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