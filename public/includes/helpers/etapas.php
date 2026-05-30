<?php
session_start();
/*
// Verifica se o usuário já está logado
if (isset($_SESSION['usuario']) && !empty($_SESSION['usuario']['login_usuario'])):
    header('Location: proposta_cadastro.php');
    exit;*/

function listarEtapas() {
    return [
        'comunicacao' => 'Comunicação',
        'detec' => 'Detec',
        'amostra' => 'Amostra',
        'inteligencia_mercado' => 'Inteligência de Mercado',
        'fotografia' => 'Fotografia',
        'detec_retrabalho' => 'Retrabalho Detec (Ajustando Pendencias)'
    ];
}

function selectEtapas($selected = null, $etapaAtual = null) {
    $etapas = listarEtapas();

    // Se etapa atual for inteligencia_mercado, permite fotografia e manipulação
    if ($etapaAtual !== 'inteligencia_mercado') {
        unset($etapas['fotografia']);
        unset($etapas['manipulacao']);
        unset($etapas['detec_retrabalho']);
    }

    $html = '<select name="proxima_etapa" required>';
    $html .= '<option value="">Selecione</option>';

    foreach ($etapas as $valor => $nome) {
        $sel = ($selected == $valor) ? 'selected' : '';
        $html .= "<option value='$valor' $sel>$nome</option>";
    }

    $html .= '</select>';

    return $html;
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