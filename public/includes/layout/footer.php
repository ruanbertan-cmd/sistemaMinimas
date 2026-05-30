<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/
?>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-left">
            Sistema de Mínimas © 2026
        </div>

        <div class="footer-right">
            Versão 2.0 | Desenvolvido por TI Interna
        </div>
    </div>
</footer>

</body>
</html>

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