# Estudo de SQL - Construção de Features para Análise de Clientes

Este projeto faz parte dos meus estudos de SQL, com foco nos conceitos fundamentais utilizados em cenários reais de análise de dados.

Ao longo do desenvolvimento desta consulta, pratiquei diversos recursos importantes da linguagem SQL e aprendi como transformar dados brutos em informações úteis para análise.

## Conceitos estudados

### Common Table Expressions (CTEs)

Utilizei múltiplas CTEs (`WITH`) para dividir uma consulta complexa em etapas menores e mais organizadas.

Esse conceito me ajudou a:

* Melhorar a legibilidade do código;
* Facilitar a manutenção das consultas;
* Construir transformações de dados passo a passo.

### Filtragem de dados

Utilizei cláusulas `WHERE` para selecionar apenas os registros relevantes para cada análise.

Aprendi a:

* Filtrar informações por data;
* Criar janelas temporais para análises recentes;
* Trabalhar com períodos específicos de atividade dos clientes.

### Funções de Data e Hora

Pratiquei funções como:

* `datetime()`
* `strftime()`
* `julianday()`

Essas funções permitiram:

* Calcular diferença entre datas;
* Identificar horários das transações;
* Criar variáveis temporais para análises comportamentais.

### Agregações

Utilizei funções de agregação como:

* `COUNT()`
* `SUM()`
* `MIN()`

Com isso aprendi a gerar métricas como:

* Quantidade de transações;
* Soma de pontos acumulados;
* Frequência de atividades dos clientes.

### Condições com CASE WHEN

Utilizei expressões condicionais para criar regras de negócio diretamente no SQL.

Exemplos:

* Separação de pontos positivos e negativos;
* Classificação de períodos do dia (manhã, tarde, noite e madrugada);
* Contagem de eventos dentro de diferentes intervalos de tempo.

### Junções (JOINs)

Pratiquei diferentes operações de junção utilizando `LEFT JOIN`.

Esse conceito foi importante para:

* Relacionar clientes, transações e produtos;
* Combinar informações de diferentes tabelas;
* Construir uma visão mais completa dos dados.

### Agrupamentos

Utilizei `GROUP BY` para resumir informações por cliente e por produto.

Aprendi a:

* Criar métricas consolidadas;
* Gerar indicadores de comportamento;
* Produzir análises em diferentes níveis de granularidade.

### Funções de Janela (Window Functions)

Utilizei `ROW_NUMBER() OVER(PARTITION BY ...)` para criar rankings.

Esse recurso permitiu:

* Identificar produtos mais utilizados por cada cliente;
* Encontrar dias da semana com maior atividade;
* Descobrir períodos do dia mais frequentes.

### Tratamento de Valores Nulos

Utilizei `COALESCE()` para substituir valores ausentes por valores padrão.

Esse conceito ajuda a:

* Evitar resultados inconsistentes;
* Melhorar a qualidade das análises;
* Preparar dados para etapas posteriores.

## O que aprendi

Este estudo me ajudou a consolidar os fundamentos de SQL aplicados a problemas reais de análise de dados.

Mais do que aprender a sintaxe, comecei a entender como transformar dados em informações úteis através de consultas estruturadas, cálculos, agregações e relacionamentos entre tabelas.

Hoje consigo construir minhas próprias consultas para explorar bases de dados, responder perguntas de negócio e criar métricas que apoiam análises do dia a dia, desenvolvendo uma base sólida para atuar com Análise de Dados e Engenharia de Dados.
