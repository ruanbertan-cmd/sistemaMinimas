<?php
session_start();

require_once __DIR__ . '/../../../config/conexao.php';

// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: index.php');
    exit;

// Se não estiver logado, redireciona para a página de validação
else:
    $link = 'http://ww1.eliane.com/index.php';
    $link = base64_encode($link);
    header('Location: https://ww1.eliane.com/valida/?link=' . $link);
    exit;
endif;
?>