<?php
require_once __DIR__ . '/config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $processoId = (int) $_POST['processo_id'];

    $metodo_imagem = $_POST['metodo_imagem'];

    $precisa_foto = isset($_POST['precisa_foto']) ? 1 : 0;
    $qtd_pecas_foto = $precisa_foto ? (int) $_POST['qtd_pecas_foto'] : 0;

    $precisa_manipulacao = isset($_POST['precisa_manipulacao']) ? 1 : 0;
    $qtd_pecas_manipulacao = $precisa_manipulacao ? (int) $_POST['qtd_pecas_manipulacao'] : 0;

    $precisa_video = isset($_POST['precisa_video']) ? 1 : 0;
    $qtd_pecas_video = $precisa_video ? (int) $_POST['qtd_pecas_video'] : 0;

    $observacaoComunicacao = $_POST['observacao'] ?? '';

    $proximaEtapa = $_POST['proxima_etapa'];

    try {

        $pdo->beginTransaction();

        // Registro info comunicação
        $stmt = $pdo->prepare("
            INSERT INTO processo_comunicacao
            (processo_id, metodo_imagem, precisa_foto, qtd_pecas_foto, precisa_manipulacao, qtd_pecas_manipulacao, precisa_video, qtd_pecas_video, observacao)
            VALUES (?,?,?,?,?,?,?,?,?)
        ");

        $stmt->execute([
            $processoId,
            $metodo_imagem,
            $precisa_foto,
            $qtd_pecas_foto,
            $precisa_manipulacao,
            $qtd_pecas_manipulacao,
            $precisa_video,
            $qtd_pecas_video,
            $observacaoComunicacao
            
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
            $proximaEtapa,
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
            $proximaEtapa,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoComunicacao

        ]);

        $pdo->commit();

        header("Location: fases.php");
        exit;

    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
    }
}