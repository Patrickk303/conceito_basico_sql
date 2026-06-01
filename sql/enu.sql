WITH Aluno_dia_01 AS (
SELECT 
DISTINCT idCliente
FROM transacoes
WHERE substr(DtCriacao,1,10) = '2025-08-25'
),
Interacoes as (
SELECT 
    t1.idCliente,
    substr(t2.DtCriacao,1,10) dtdia,
    count(*) AS Numero_Int
FROM Aluno_dia_01 t1
LEFT JOIN transacoes t2
ON t1.idCliente = t2.idCliente
AND t2.DtCriacao >= '2025-08-25'
AND t2.DtCriacao < '2025-08-30'
GROUP BY t1.idCliente, substr(t2.DtCriacao,1,10)
),
Valoresmax AS (
SELECT 
    idCliente,
    max(Numero_Int) AS MaiorInt
FROM Interacoes
GROUP BY IdCliente
)

SELECT 
    t1.idCliente,
    max(t2.dtdia) AS MaxDia,

FROM Valoresmax t1
LEFT JOIN Interacoes t2
ON t1.MaiorInt = t2.Numero_Int
AND t1.idCliente = t2.idCliente
GROUP BY t1.idCliente
ORDER BY t1.idCliente;


-- query com windows funticion

-- Correção query

WITH aluno_dia01 AS (
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
),

tb_dia_cliente AS (

    SELECT t1.idCliente,
        substr(t2.DtCriacao,1,10) AS dtdia,
        count(*) AS qtdeInteracoes
    FROM aluno_dia01 AS t1
    LEFT JOIN transacoes AS t2
    ON t1.idCliente = t2.idCliente
    AND t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao >= '2025-08-30'
    GROUP BY t2.idCliente, dtdia 
    ORDER BY t1.idCliente, dtdia
),

tb_rn AS (
SELECT *,
    row_number() OVER (PARTITION BY idCliente ORDER BY qtdeInteracoes DESC) AS rn
FROM tb_dia_cliente 
)

SELECT *
FROM tb_rn
WHERE rn = 1;