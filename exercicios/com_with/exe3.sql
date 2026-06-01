
WITH tb_diario AS (
SELECT 
    substr(DtCriacao,1,10) AS dtdia,
    count(DISTINCT IdTransacao) AS trans_dia
FROM transacoes
GROUP BY dtdia
ORDER BY dtdia desc
),
tb_acumulada AS (
SELECT 
    *,
    sum(trans_dia) OVER(ORDER BY dtdia) AS acumulada
FROM tb_diario
)

SELECT *
FROM tb_acumulada
WHERE acumulada > 100000
ORDER BY acumulada 
LIMIT 1