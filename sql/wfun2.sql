--- soma de transações por cliente no curso sql
WITH cliente_tran AS (
    SELECT 
        idCliente,
        substr(DtCriacao,1,10) AS dtDia,
        count(DISTINCT IdTransacao) NumTrans
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
    GROUP BY idCliente, dtDia
),

leg_lag AS 
(
SELECT 
    *,
    sum(NumTrans) OVER (PARTITION BY idCliente ORDER BY dtDia) AS acum,
    lag(NumTrans) OVER (PARTITION BY idCliente ORDER BY dtDia) AS lag
    
FROM cliente_tran
GROUP BY idCliente,dtdia
)

SELECT *,
    1.* NumTrans / lag
FROM leg_lag
