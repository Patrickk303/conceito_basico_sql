-- quais clientes de janeiro fizeram o curso de sql

WITH clientes_sql AS (
SELECT
    DISTINCT idCliente
FROM transacoes
WHERE DtCriacao >= '2025-08-25'
AND DtCriacao < '2025-08-30'
),

clientes_jan AS (
SELECT
    DISTINCT idCliente
FROM transacoes
WHERE DtCriacao >= '2025-01-01'
AND DtCriacao < '2025-02-01'
)


SELECT 
    count(DISTINCT t1.idCliente),
    count(DISTINCT t2.idCliente)
FROM clientes_jan t1
LEFT JOIN clientes_sql t2
ON t1.idCliente = t2.idCliente
