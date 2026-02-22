<?php
session_start();
require_once "../config/conexao.php";

if (isset($_FILES['arquivo']) && $_FILES['arquivo']['error'] == 0) {

    $arquivoTmp = $_FILES['arquivo']['tmp_name'];

    if (($handle = fopen($arquivoTmp, "r")) !== FALSE) {

        // Pular cabeçalho
        fgetcsv($handle, 1000, ",");

        try {

            $pdo->beginTransaction();

            // Revisar para minha tabela e colunas
            $stmt = $pdo->prepare(
                "INSERT INTO cadastros_itens_minimas (codigo, descricao, marca) 
                 VALUES (:codigo, :descricao, :marca)"
            );

            $contagemMarcas = [
                'Eliane' => 0,
                'Decortiles' => 0,
                'Elizabeth' => 0
            ];

            $totalImportado = 0;

            while (($dados = fgetcsv($handle, 1000, ",")) !== FALSE) {

                $codigo = trim($dados[0]);
                $descricao = trim($dados[1]);
                $marca = trim($dados[2]);

                $stmt->execute([
                    ':codigo' => $codigo,
                    ':descricao' => $descricao,
                    ':marca' => $marca
                ]);

                if (isset($contagemMarcas[$marca])) {
                    $contagemMarcas[$marca]++;
                }

                $totalImportado++;
            }

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

        fclose($handle);
    }
} else {

    $_SESSION['upload_erro'] = "Nenhum arquivo válido enviado.";
    header("Location: cadastro.php");
    exit;
}