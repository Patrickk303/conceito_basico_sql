
WITH cliente_dia AS (
SELECT 
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS dtdia
FROM transacoes
WHERE substr(DtCriacao,1,4) = '2025'
ORDER BY idCliente, dtdia
),


tb_lag AS (
SELECT 
    *,
    lag(dtdia) OVER (PARTITION BY idCliente ORDER BY dtdia) AS lagdia
FROM cliente_dia
),

tb_numero_dia AS (
SELECT *,
    julianday(dtdia) - julianday(lagdia) AS DifDia
FROM tb_lag
),

avg_cliente AS (
SELECT
    idCliente,
    avg(DifDia) AS MediaDia
FROM tb_numero_dia
GROUP BY idCliente
)


SELECT 
    avg(MediaDia)
FROM avg_cliente