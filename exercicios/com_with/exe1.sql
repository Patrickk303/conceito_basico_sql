
WITH
tb_primeiro_dia AS (
SELECT DISTINCT idCliente
FROM transacoes
WHERE substr(DtCriacao,1,10) = '2025-08-25'
),
Dias_De_Curso as (
SELECT
    DISTINCT idCliente,
    substr(DtCriacao,1,10) AS PresençaDia
FROM transacoes
WHERE substr(DtCriacao,1,10) >= '2025-08-25'
AND substr(DtCriacao,1,10) < '2025-08-30'
ORDER BY idCliente, PresençaDia
)

SELECT *
FROM tb_primeiro_dia AS t1
LEFT JOIN Dias_De_Curso AS t2
ON t1.idCliente = t2.idCliente
