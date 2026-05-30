<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/
?>

<nav>
    <ul class="menu">
        <li><a href="/index.php">Dashboard</a></li>
        <li><a href="/includes/cadastro/cadastro.php">Cadastro</a></li>
        <li><a href="/includes/logs/fases.php">Fases</a></li>
        <li><a href="/includes/relatorios/pacote.php">Pacote</a></li>
        <li><a href="/includes/produto/produto.php">Produto</a></li>
    </ul>
</nav>

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