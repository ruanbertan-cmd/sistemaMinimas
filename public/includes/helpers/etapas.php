<?php

function listarEtapas() {
    return [
        'detec' => 'Detec',
        'amostra' => 'Amostra',
        'inteligencia_mercado' => 'Inteligência de Mercado',
        'fotografia' => 'Fotografia',
        'comunicacao' => 'Comunicação'
    ];
}

function selectEtapas($selected = null) {

    $etapas = listarEtapas();

    $html = '<select name="proxima_etapa" required>';
    $html .= '<option value="">Selecione</option>';

    foreach ($etapas as $valor => $nome) {

        $sel = ($selected == $valor) ? 'selected' : '';

        $html .= "<option value='$valor' $sel>$nome</option>";
    }

    $html .= '</select>';

    return $html;
}