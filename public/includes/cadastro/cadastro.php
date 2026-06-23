<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

require_once __DIR__ . '/../../../config/conexao.php';
require_once __DIR__ . '/../layout/header.php';
require_once __DIR__ . '/../layout/menu.php';

// Visualização colunas necessárias para cadastro de produtos
$tabela = "SM_cadastros_itens_minimas";
$stmt = $pdo->prepare("
    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA = DATABASE()
      AND TABLE_NAME = ?
      AND COLUMN_NAME NOT IN ('id', 'data_criacao', 'responsavel_carga')
    ORDER BY ORDINAL_POSITION
");
$stmt->execute([$tabela]);
$colunas = $stmt->fetchAll(PDO::FETCH_COLUMN);


?>

<div class="container">
    <h1>Cadastro de Produtos</h1>

    <?php
    if (isset($_SESSION['upload_erro'])):
    ?>
    <div class="alert-erro">
        <?= $_SESSION['upload_erro']; ?>
    </div>
    <?php
    unset($_SESSION['upload_erro']);
    endif;
    ?>

    <div class="form-wrapper">
        <div class="form-card">
            <form action="upload.php" method="POST" enctype="multipart/form-data">

                <div class="form-group">
                    <label>Selecionar arquivo CSV</label>
                    <input class="input-cadastro" type="file" name="arquivo" required>
                </div>

                <div class="form-actions">
                    <button type="submit">Enviar Arquivo</button>
                </div>

            </form><br>

        <div class="campos-upload">
            <h3>ℹ️</h3>
            <div class="lista-colunas" style=" max-height: 200px; overflow-y: auto; border: 1px solid #ccc; padding: 10px;">
                ℹ️ Os campos abaixo devem estar presentes no arquivo CSV para que o upload seja realizado com sucesso:
                <?php foreach ($colunas as $coluna): ?>
                    <p><?= htmlspecialchars($coluna) ?></p>
                <?php endforeach; ?>
            </div>
        </div>

        </div>
    </div>
</div>

<?php require_once __DIR__ . '/../layout/footer.php'; ?>

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