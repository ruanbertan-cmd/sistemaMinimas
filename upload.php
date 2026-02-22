<?php
require_once "../config/conexao.php";

if (isset($_FILES['arquivo']) && $_FILES['arquivo']['error'] == 0) {

    $arquivoTmp = $_FILES['arquivo']['tmp_name'];

    if (($handle = fopen($arquivoTmp, "r")) !== FALSE) {

        // Pula cabeçalho
        fgetcsv($handle, 1000, ",");

        try {

            $pdo->beginTransaction();

            $stmt = $pdo->prepare(
                "INSERT INTO clientes (nome, email, telefone) 
                 VALUES (:nome, :email, :telefone)"
            );

            while (($dados = fgetcsv($handle, 1000, ",")) !== FALSE) {

                $stmt->execute([
                    ':nome' => $dados[0],
                    ':email' => $dados[1],
                    ':telefone' => $dados[2]
                ]);
            }

            $pdo->commit();
            echo "Importação realizada com sucesso!";

        } catch (Exception $e) {
            $pdo->rollBack();
            echo "Erro ao importar: " . $e->getMessage();
        }

        fclose($handle);
    }
}
