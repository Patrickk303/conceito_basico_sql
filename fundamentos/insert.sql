


-- DROP TABLE IF EXISTS relatorio_diario;

-- CREATE TABLE IF NOT EXISTS relatorio_diario AS 

DELETE FROM relatorio_diario;

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


INSERT INTO relatorio_diario

SELECT 
    *
FROM acumulado;

SELECT *
FROM relatorio_diario;

