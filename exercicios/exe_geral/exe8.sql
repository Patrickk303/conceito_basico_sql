
WITH acumulado AS (
SELECT 
    idCliente,
    qtdePontos,
    substr(DtCriacao,1,10) AS dtdia,
    sum(qtdePontos) OVER (PARTITION BY idCliente ORDER BY substr(DtCriacao,1,10)) AS AcumPontos
FROM transacoes
WHERE qtdePontos > 0
GROUP BY idCliente, dtdia
)

SELECT 
    *
FROM acumulado
