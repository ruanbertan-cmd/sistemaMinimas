<?php
require_once __DIR__ . '/config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $processoId = (int) $_POST['processo_id'];

    $necessitaFoto = isset($_POST['precisa_foto']) ? 1 : 0;
    $qtdeFoto = $necessitaFoto ? (int) $_POST['qtd_pecas_foto'] : 0;

    $necessitaVideo = isset($_POST['precisa_video']) ? 1 : 0;
    $qtdeVideo = $necessitaVideo ? (int) $_POST['qtd_pecas_video'] : 0;

    $observacaoComunicacao = $_POST['observacao'] ?? '';

    $proximaEtapa = $_POST['proxima_etapa'];

    try {

        $pdo->beginTransaction();

        // Atualiza processo
        $stmt = $pdo->prepare("
            UPDATE processo_comunicacao
            SET 
                precisa_foto = ?,
                qtd_pecas_foto = ?,
                precisa_video = ?,
                qtd_pecas_video = ?,
                observacao = ?
            WHERE id = ?
        ");

        $stmt->execute([
            $necessitaFoto,
            $qtdeFoto,
            $necessitaVideo,
            $qtdeVideo,
            $observacaoComunicacao,
            $processoId
        ]);

        // Log
        $stmtLog = $pdo->prepare("
            UPDATE itens_processos
            SET etapa_atual = ?,
            status_geral = 'em_andamento'
            WHERE id = ?
        ");

        $stmtLog->execute([
            $proximaEtapa,
            $processoId
        ]);

        $pdo->commit();

        header("Location: fases.php");
        exit;

    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
    }
}