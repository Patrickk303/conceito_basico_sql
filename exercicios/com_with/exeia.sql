WITH cliente_trans AS (
SELECT 
    idCliente,
    substr(DtCriacao,1,10) AS dtdia,
    count(*) AS Numtrans
FROM transacoes
WHERE substr(DtCriacao,1,4) = '2025'
GROUP BY idCliente, dtdia
),

tb_lag AS (
SELECT 
    *,
    lag(dtdia) OVER (PARTITION BY idCliente ORDER BY dtdia) AS lag
FROM cliente_trans
)

SELECT 
    *,
    1.* julianday(dtdia) - julianday(lag) AS DifDia
FROM tb_lag
WHERE DifDia is not null