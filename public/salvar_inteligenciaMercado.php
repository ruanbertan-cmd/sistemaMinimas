<?php

date_default_timezone_set('America/Sao_Paulo');

require_once __DIR__ . '/../config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $pecasSeparadas = $_POST['pecas_separadas'] ?? '';
    $qtdDeAcordo = $_POST['qtd_de_acordo'] ?? '';
    $qualidade = $_POST['qualidade'] ?? '';
    $identificacao = $_POST['identificacao'] ?? '';
    $observacaoInteligenciaMercado = $_POST['observacao_inteligenciaMercado'] ?? '';
    $proximaEtapaInteligenciaMercado = $_POST['proxima_etapa'] ?? '';

    try {

        $pdo->beginTransaction();

        // Registro info Inteligencia de Mercado
        $stmt = $pdo->prepare("
            INSERT INTO processo_inteligenciaMercado
            (processo_id, pecas_separadas, qtd_de_acordo, qualidade, identificacao, observacao_inteligenciaMercado, proxima_etapa)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmt->execute([
            $processoId,
            $pecasSeparadas,
            $qtdDeAcordo,
            $qualidade,
            $identificacao,
            $observacaoInteligenciaMercado,
            $proximaEtapaInteligenciaMercado
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
            $proximaEtapaInteligenciaMercado,
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
            $proximaEtapaInteligenciaMercado,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoInteligenciaMercado
        ]);

        $pdo->commit();

        header("Location: fases.php");
        exit;
    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
    }
}