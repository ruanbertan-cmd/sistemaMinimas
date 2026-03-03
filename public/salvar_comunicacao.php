<?php
require_once __DIR__ . '/config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $processoId = (int) $_POST['processo_id'];

    $necessitaFoto = isset($_POST['necessita_foto']) ? 1 : 0;
    $qtdeFoto = $necessitaFoto ? (int) $_POST['qtde_foto'] : 0;

    $necessitaVideo = isset($_POST['necessita_video']) ? 1 : 0;
    $qtdeVideo = $necessitaVideo ? (int) $_POST['qtde_video'] : 0;

    $proximaEtapa = $_POST['proxima_etapa'];

    try {

        $pdo->beginTransaction();

        // Atualiza processo
        $stmt = $pdo->prepare("
            UPDATE itens_processos
            SET 
                necessita_foto = ?,
                qtde_foto = ?,
                necessita_video = ?,
                qtde_video = ?,
                etapa_atual = ?
            WHERE id = ?
        ");

        $stmt->execute([
            $necessitaFoto,
            $qtdeFoto,
            $necessitaVideo,
            $qtdeVideo,
            $proximaEtapa,
            $processoId
        ]);

        // Log
        $stmtLog = $pdo->prepare("
            INSERT INTO itens_movimentacoes
            (processo_id, area, acao, usuario)
            VALUES (?, 'comunicacao', 'liberou_processo', 'usuario_sistema')
        ");

        $stmtLog->execute([$processoId]);

        $pdo->commit();

        header("Location: fases.php");
        exit;

    } catch (Exception $e) {

        $pdo->rollBack();
        die("Erro: " . $e->getMessage());
    }
}