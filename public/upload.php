<?php
session_start();
require_once __DIR__ . "/config/conexao.php";

if (isset($_FILES['arquivo']) && $_FILES['arquivo']['error'] == 0) {

    $arquivoTmp = $_FILES['arquivo']['tmp_name'];

    if (($handle = fopen($arquivoTmp, "r")) !== FALSE) {

        try {

            $pdo->beginTransaction();

            $stmtItem = $pdo->prepare("
                INSERT INTO cadastros_itens_minimas (
                    marca,
                    categoria_pt_br,
                    categoria_us,
                    categoria_es,
                    serie,
                    tamanho_nominal,
                    descricao,
                    codigo_barras_cx,
                    superficie_pt_br,
                    superficie_us,
                    superficie_es,
                    junta_assentamento,
                    abrasao_superficial,
                    variacao_tonalidade,
                    unidade_medida,
                    pecas_caixa,
                    m2_caixa,
                    peso_caixa,
                    coeficiente_atrito,
                    espessura,
                    grupo_absorcao,
                    item_ativo,
                    cor_pt_br,
                    cor_us,
                    cor_es,
                    recomendado_uso,
                    local_uso,
                    retificado,
                    polo,
                    lancamento,
                    estilo,
                    estilo_us,
                    estilo_es,
                    relevo,
                    rodape,
                    numeros_face,
                    tamanho_fabricacao,
                    codigo_item,
                    unidade_fabricacao,
                    monocalibre,
                    CicloLancamento,
                    responsavel_carga
                )
                VALUES (
                    ?,?,?,?,?,?,?,?,?,?,
                    ?,?,?,?,?,?,?,?,?,?,
                    ?,?,?,?,?,?,?,?,?,?,
                    ?,?,?,?,?,?,?,?,?,?,
                    ?,?
                )
            ");

            $stmtProcesso = $pdo->prepare("
                INSERT INTO itens_processos (item_id, etapa_atual, status_geral)
                VALUES (?, 'Definição Inicial Comunicação', 'Em Andamento')
            ");

            $stmtLog = $pdo->prepare("
                INSERT INTO itens_movimentacoes (processo_id, area, acao, usuario)
                VALUES (?, 'Inteligência de Mercado', 'Processo Iniciado', 'quem carregou o arquivo')
            "); // Aqui idealmente deveria ser o usuário logado, mas como não temos sistema de login, deixei um placeholder

            $contagemMarcas = [
                'Eliane' => 0,
                'Decortiles' => 0,
                'Elizabeth' => 0
            ];

            $totalImportado = 0;

            while (($dados = fgetcsv($handle, 1000, ",")) !== FALSE) {

                $stmtItem->execute($dados);

                $itemId = $pdo->lastInsertId();

                $stmtProcesso->execute([$itemId]);
                $processoId = $pdo->lastInsertId();

                $stmtLog->execute([$processoId]);

                $marca = trim($dados[0]);

                if (isset($contagemMarcas[$marca])) {
                    $contagemMarcas[$marca]++;
                }

                $totalImportado++;
            }

            fclose($handle);

            $pdo->commit();

            $_SESSION['upload_sucesso'] = true;
            $_SESSION['total'] = $totalImportado;
            $_SESSION['marcas'] = $contagemMarcas;

            header("Location: cadastro.php");
            exit;

        } catch (Exception $e) {

            $pdo->rollBack();

            $_SESSION['upload_erro'] = "Erro ao importar: " . $e->getMessage();
            header("Location: cadastro.php");
            exit;
        }
    }
} else {
    $_SESSION['upload_erro'] = "Nenhum arquivo válido enviado.";
    header("Location: cadastro.php");
    exit;
}