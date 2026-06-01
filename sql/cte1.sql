/*
Problema : Analisar a curva de churn ao logo do curso de sql

*/

-- pega com base naqueles que assinaram a lista de presença
SELECT 
    substr(t.DtCriacao,1,10) AS data_simples,
    count(DISTINCT idCliente) AS contagem
FROM transacoes t
LEFT JOIN transacao_produto tp
ON t.IdTransacao = tp.IdTransacao
WHERE t.DtCriacao >= '2025-08-25'
AND t.DtCriacao < '2025-08-30'
AND tp.IdProduto = 11
GROUP BY substr(t.DtCriacao,1,10);

-- query do professor
WITH dia1 AS (
SELECT 
    DISTINCT idCliente,
    substr(DtCriacao,1,10)
FROM transacoes
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-26'
)

SELECT 
    count(DISTINCT t1.idCliente) idcliente,
    substr(DtCriacao,1,10) dtDia
FROM dia1 t1
LEFT JOIN transacoes t2
ON t1.idCliente = t2.idCliente
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'
GROUP BY dtDia;


-- Query que pega só como base os clientes do primeiro dia
WITH Dia1 AS (
SELECT
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS dtDia
FROM transacoes
WHERE dtDia = '2025-08-25' ),
Dia2 AS (
SELECT
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS dtDia
FROM transacoes
WHERE dtDia = '2025-08-26'
),
Dia3 AS (
SELECT
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS dtDia
FROM transacoes
WHERE dtDia = '2025-08-27'
),
Dia4 AS (
SELECT
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS dtDia
FROM transacoes
WHERE dtDia = '2025-08-28'
),
Dia5 AS (
SELECT
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS dtDia
FROM transacoes
WHERE dtDia = '2025-08-29'
)


SELECT
    count(d1.idCliente) AS Clientd1,
    count(d2.idCliente) AS Clientd2,
    count(d3.idCliente) AS Clientd3,
    count(d4.idCliente) AS Clientd4,
    count(d5.idCliente) AS Clientd5
FROM Dia1 d1
LEFT JOIN Dia2 d2
ON d1.idCliente = d2.idCliente
LEFT JOIN Dia3 d3
ON d2.idCliente = d3.idCliente
LEFT JOIN Dia4 d4
ON d3.idCliente = d4.idCliente
LEFT JOIN Dia5 d5
ON d4.idCliente = d5.idCliente;