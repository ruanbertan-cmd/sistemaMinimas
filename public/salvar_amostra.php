<?php

date_default_timezone_set('America/Sao_Paulo');

require_once __DIR__ . '/../config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $metodoAmostra = $_POST['metodo_amostra'] ?? '';
    $observacaoAmostra = $_POST['observacao_amostra'] ?? '';
    $proximaEtapaAmostra = $_POST['proxima_etapa_amostra'] ?? '';

    try {

        $pdo->beginTransaction();

        // Registro info Amostra
        $stmt = $pdo->prepare("
            INSERT INTO processo_amostra
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
            FROM itens_processos
            WHERE id = ?
        ");
        $stmtEtapaAtual->execute([$processoId]);
        $etapaAtual = $stmtEtapaAtual->fetchColumn();

        // Atualizando etapda do item para a nova
        $stmtupdate = $pdo->prepare("
            UPDATE itens_processos
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
            INSERT INTO itens_movimentacoes
            (processo_id, area_origem, area_destino, acao, usuario, observacao)
            VALUES (?,?,?,?,?,?)
        ");

        $stmtLog->execute([
            $processoId,
            $etapaAtual,
            $proximaEtapaAmostra,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoAmostra
        ]);

        $pdo->commit();

        header("Location: fases.php");
        exit;
    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
    }
}