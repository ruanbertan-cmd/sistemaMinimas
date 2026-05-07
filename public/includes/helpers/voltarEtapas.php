<?php

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
    $stmt = $pdo->prepare("SELECT etapa_atual FROM itens_processos WHERE id = ?");
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
        UPDATE itens_processos
        SET etapa_atual = ?, status_geral = 'em_andamento'
        WHERE id = ?
    ");
    $stmtUpdate->execute([$etapaAnterior, $processoId]);

    // Registrar log
    $stmtLog = $pdo->prepare("
        INSERT INTO itens_movimentacoes
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
