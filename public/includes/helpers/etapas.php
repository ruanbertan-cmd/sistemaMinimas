<?php

function listarEtapas() {
    return [
        'detec' => 'Detec',
        'amostra' => 'Amostra',
        'inteligencia_mercado' => 'Inteligência de Mercado',
        'fotografia' => 'Fotografia',
        'manipulacao' => 'Manipulação',
        'comunicacao' => 'Comunicação'
    ];
}

function selectEtapas($selected = null, $etapaAtual = null) {
    $etapas = listarEtapas();

    // Se etapa atual for inteligencia_mercado, permite fotografia e manipulação
    if ($etapaAtual !== 'inteligencia_mercado') {
        unset($etapas['fotografia']);
        unset($etapas['manipulacao']);
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
