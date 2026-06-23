<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/
require_once __DIR__ . '/../../../config/conexao.php';

date_default_timezone_set('America/Sao_Paulo');

if (isset($_FILES['arquivo']) && $_FILES['arquivo']['error'] == 0) {

    $arquivoTmp = $_FILES['arquivo']['tmp_name'];

    if (($handle = fopen($arquivoTmp, "r")) !== FALSE) {

        try {

            $pdo->beginTransaction();

            $stmtItem = $pdo->prepare("
                INSERT INTO SM_cadastros_itens_minimas (
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
                    ciclo_lancamento,
                    data_criacao,
                    responsavel_carga
                )
                VALUES (
                    UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),?,UPPER(?),UPPER(?),
                    UPPER(?),?,?,UPPER(?),UPPER(?),?,?,?,UPPER(?),?,
                    UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),
                    UPPER(?),UPPER(?),UPPER(?),UPPER(?),UPPER(?),?,UPPER(?),?,UPPER(REPLACE(?, ' ', '')),UPPER(?),
                    ?,NOW(),'usuario Cadastrante'
                )
            ");

            $stmtProcesso = $pdo->prepare("
                INSERT INTO SM_itens_processos (item_id, etapa_atual, status_geral)
                VALUES (?, 'comunicacao', 'em_andamento')
            ");

            $stmtLog = $pdo->prepare("
                INSERT INTO SM_itens_movimentacoes (processo_id, area_origem, area_destino, acao, usuario, observacao, data_acao)
                VALUES (?, 'Criação de Item', 'Inteligência de Mercado', 'Processo Iniciado', 'usuario', 'Inicio do Processo', NOW())
            "); // Aqui idealmente deveria ser o usuário logado, mas como não temos sistema de login, deixei um placeholder

            $contagemMarcas = [
                'Eliane' => 0,
                'Decortiles' => 0,
                'Elizabeth' => 0
            ];

            $totalImportado = 0;

            while (($dados = fgetcsv($handle, 1000, ";")) !== FALSE) {
                    // Corrige vírgulas decimais para ponto
                    $dados[16] = str_replace(',', '.', $dados[16]); // m2_caixa
                    $dados[17] = str_replace(',', '.', $dados[17]); // peso_caixa
                    $dados[19] = str_replace(',', '.', $dados[19]); // espessura
                    // ... faça isso para todas as colunas numéricas que vêm com vírgula

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