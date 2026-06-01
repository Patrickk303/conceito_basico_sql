
WITH clientes_trans AS (
SELECT 
    idCliente,
    count(DISTINCT IdTransacao) AS NumTrans,
    substr(DtCriacao, 1,10) AS dtdia
FROM transacoes
GROUP BY IdCliente, dtdia
),

Maxtrans AS (
SELECT
    idCliente,
    max(NumTrans) AS Max
FROM clientes_trans
GROUP BY idCliente
),

dia_semana AS (
SELECT 
    t1.idCliente,
    t1.Max,
    CASE
    WHEN strftime('%w', t2.dtdia) = '0' THEN 'Domingo'
    WHEN strftime('%w', t2.dtdia) = '1' THEN 'Segunda'
    WHEN strftime('%w', t2.dtdia) = '2' THEN 'Terça'
    WHEN strftime('%w', t2.dtdia) = '3' THEN 'Quarta'
    WHEN strftime('%w', t2.dtdia) = '4' THEN 'Quinta'
    WHEN strftime('%w', t2.dtdia) = '5' THEN 'Sexta'
    WHEN strftime('%w', t2.dtdia) = '6' THEN 'Sabado'                    
    END Dia_Da_Semana
FROM Maxtrans t1
LEFT JOIN clientes_trans t2
ON t1.idCliente = t2.idCliente
AND t1.Max = t2.NumTrans
GROUP BY t1.idCliente
)

SELECT 
    count(*) TransDia,
    Dia_Da_Semana
FROM dia_semana
GROUP BY Dia_Da_Semana
ORDER BY TransDia
LIMIT 7