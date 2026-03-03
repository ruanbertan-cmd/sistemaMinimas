<?php
require_once __DIR__ . '/includes/header.php';
require_once __DIR__ . '/includes/menu.php';
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
                    <input type="file" name="arquivo" required>
                </div>

                <div class="form-actions">
                    <button type="submit">Enviar Arquivo</button>
                </div>

            </form>
        </div>
    </div>
</div>

<?php require_once __DIR__ . '/includes/footer.php'; ?>