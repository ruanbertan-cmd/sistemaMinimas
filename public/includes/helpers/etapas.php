<?php

function listarEtapas() {
    return [
        'comunicacao' => 'Comunicação',
        'detec' => 'Detec',
        'amostra' => 'Amostra',
        'inteligencia_mercado' => 'Inteligência de Mercado',
        'manipulacao' => 'Manipulação',
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
