<?php

date_default_timezone_set('America/Sao_Paulo');

require_once __DIR__ . '/../../../config/conexao.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $processoId = (int) $_POST['processo_id'];
    $pecasSeparadas = $_POST['pecas_separadas'] ?? 0;
    $qtdDiferente = $_POST['qtd_diferente'] ?? 0;
    $qualidade = $_POST['qualidade'] ?? 0;
    $identificacao = $_POST['identificacao'] ?? 0;
    $observacaoInteligenciaMercado = $_POST['observacao_inteligenciaMercado'] ?? '';
    $proximaEtapaInteligenciaMercado = $_POST['proxima_etapa'] ?? '';

    try {

        $pdo->beginTransaction();

        // Registro info Inteligencia de Mercado
        $stmt = $pdo->prepare("
            INSERT INTO SM_processo_inteligenciaMercado
            (processo_id, pecas_separadas, qtd_diferente, qualidade, identificacao, observacao_inteligenciaMercado, proxima_etapa)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmt->execute([
            $processoId,
            $pecasSeparadas,
            $qtdDiferente,
            $qualidade,
            $identificacao,
            $observacaoInteligenciaMercado,
            $proximaEtapaInteligenciaMercado
        ]);

        // Lista de pendências que podem ter evidência
        $pendencias = [
            'arquivo_qtd'           => 'qtd_diferente',
            'arquivo_qualidade'     => 'qualidade',
            'arquivo_identificacao' => 'identificacao'
        ];

        $flags = [
            'pecas_separadas'  => $pecasSeparadas,
            'qtd_diferente'    => $qtdDiferente,
            'qualidade'        => $qualidade,
            'identificacao'    => $identificacao
        ];

        foreach ($pendencias as $campoArquivo => $tipoPendencia) {
            if ($flags[$tipoPendencia] == 1) {
                $nomeArquivo = null;

                // Se tiver arquivo válido, move e guarda o nome
                if (!empty($_FILES[$campoArquivo]['name']) && $_FILES[$campoArquivo]['error'] === 0) {
                    $arquivoTmp = $_FILES[$campoArquivo]['tmp_name'];
                    $nomeArquivo = uniqid() . '_' . basename($_FILES[$campoArquivo]['name']);
                    $destino = __DIR__ . '/evidencias/' . $nomeArquivo;
                    move_uploaded_file($arquivoTmp, $destino);
                }

                // Sempre insere a pendência, mesmo sem arquivo
                $stmtEvidencia = $pdo->prepare("
                    INSERT INTO SM_evidencias_inteligenciaMercado
                    (processo_id, tipo_pendencia, caminho_arquivo, data_registro, registrado_por, status_evidencia)
                    VALUES (?, ?, ?, ?, ?, ?)
                ");
                $stmtEvidencia->execute([
                    $processoId,
                    $tipoPendencia,
                    $nomeArquivo, // pode ser null
                    date('Y-m-d H:i:s'),
                    'usuarioSistema',
                    'pendente'
                ]);
            }
        }

        // Salvando fase Atual para Atualizacao Log posteriormente
        $stmtEtapaAtual = $pdo->prepare("
            SELECT etapa_atual
            FROM SM_itens_processos
            WHERE id = ?
        ");
        $stmtEtapaAtual->execute([$processoId]);
        $etapaAtual = $stmtEtapaAtual->fetchColumn();

        // Atualizando etapa do item para a nova
        if ($proximaEtapaInteligenciaMercado === 'fotografia') {
            // Caso especial: Fotografia precisa passar por Comunicação (aprovação)
            $stmtupdate = $pdo->prepare("
                UPDATE SM_itens_processos
                SET etapa_atual = 'comunicacao',
                    status_geral = 'preparando_envio'
                WHERE id = ?
            ");
            $stmtupdate->execute([$processoId]);
        } else {
            // Demais etapas seguem fluxo normal
            $stmtupdate = $pdo->prepare("
                UPDATE SM_itens_processos
                SET etapa_atual = ?,
                    status_geral = 'em_andamento'
                WHERE id = ?
            ");
            $stmtupdate->execute([
                $proximaEtapaInteligenciaMercado,
                $processoId
            ]);
        }


        // Se a próxima etapa for fotografia, vincula o item a um pacote
        if ($proximaEtapaInteligenciaMercado === 'fotografia') {
            // Verifica se já existe pacote aberto
            $stmtPacote = $pdo->query("SELECT id FROM pacotes_envio WHERE status='aberto' LIMIT 1");
            $pacoteId = $stmtPacote->fetchColumn();

            if (!$pacoteId) {
                $stmtInsertPacote = $pdo->prepare("INSERT INTO pacotes_envio (status, aprovado_por) VALUES ('aberto', ?)");
                $stmtInsertPacote->execute(['InteligenciaMercado']);
                $pacoteId = $pdo->lastInsertId();
            }

            // Vincula item ao pacote
            $stmtItem = $pdo->prepare("INSERT INTO pacote_itens (pacote_id, processo_id) VALUES (?, ?)");
            $stmtItem->execute([$pacoteId, $processoId]);
        }


        // Salvando log da alteracao de fase

        $destino = ($proximaEtapaInteligenciaMercado === 'fotografia') 
            ? 'comunicacao' 
            : $proximaEtapaInteligenciaMercado;

        $stmtLog = $pdo->prepare("
            INSERT INTO SM_itens_movimentacoes
            (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
            VALUES (?,?,?,?,?,?,?)
        ");

        $stmtLog->execute([
            $processoId,
            $etapaAtual,
            $destino,
            'liberacao_etapa',
            'usuarioSistema',
            $observacaoInteligenciaMercado,
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