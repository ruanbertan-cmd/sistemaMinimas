# Processos para revisar no projeto:

# 1 - Peças Manipulação enviadas pelo Detec
Essas peças em especifico que será encaminhado para Manipulação, precisa vir em pallet separado para não ter dificuldade na separação com as demais peças, precisamos separadas, pois os itens de manipulação ficam dentro da empresa com a Comunicação Interna e demais peças são enviadas para o Fotografo.

# 2 - Pendencias checklist Inteligencia Mercado, pensar em como tratar...

Pensar no modelo que vai funcionar quando chegar para Inteligência de Mercado e tiver algum dos 4 possíveis problemas

1. pecas separadas
2. quantidade de acordo
3. qualidade
4. identificacao

1. pecas separadas:
Verificar com amostra, caso não achar, cai no mesmo processo da "quantidade de acordo"

2. quantidade de acordo:
Ver se faces precisam ser diferentes, se sim, vai para Detec se não amostra

3. qualidade:
Ver se faces precisam ser diferentes, se sim, vai para Detec se não amostra

4. identificacao:
Avaliar com Detec para nomeação das peças


Observação:
Legar armazenar evidencias. Opção para upload de imagem "prova" do defeito aparente



# Sistema para Controle de Fluxo de Imagens
Este projeto é um sistema interno para gestão de pacotes de envio, integrando diferentes etapas do fluxo de aprovação e controle de itens. Ele foi desenvolvido em PHP com MySQL, utilizando uma interface simples e tabelas para visualização dos dados.


**⚙️ Como funciona**
O sistema organiza o fluxo em fases sequenciais, garantindo rastreabilidade e controle:

1. Inteligência de Mercado

Inclusão dos itens que precisam de foto no sistema.

Responsável por iniciar o processo.

2. Comunicação

Classifica a necessidade de Foto, Manipulação ou Vídeo.

Define quantidades e observações específicas.

Registra em processo_comunicacao.

3. Detec

Técnicos da fábrica fazem a separação de faces distintas e complementos.

Etapa crítica porque os itens passam pelo forno.

Melhor momento para separar peças sem duplicidade.

4. Amostra

Caso já tenha produção em estoque, pode ser separado pela amostra.

Faces aleatórias, podendo haver duplicadas.

Depois retorna para Inteligência de Mercado para conferência.

5. Inteligência de Mercado (Conferência)

Verifica nomeação das peças, qualidade, localização e quantidade solicitada.

Se estiver de acordo, segue para Fotografia ou Manipulação.

6. Manipulação

Peças usadas apenas para manipulação interna ficam na sala de Comunicação.

Não seguem para Fotografia.

7. Fotografia

Peças que precisam ser fotografadas ou filmadas são encaminhadas ao fotógrafo.

Registra agendamento com data/hora e responsável.

Bloqueado até Comunicação aprovar.

Pacotes de Envio

Itens aprovados e validados começam a formar pacotes.

Fluxo obrigatório: Comunicação → Fotógrafo → Envio.

Registra status, data_fechamento, aprovado_por, data_agendamento, responsavel_fotografia e data_envio.