-- numero de usuario acumulados e absoluto

WITH tb_cadastro_data AS 
(
SELECT 
    substr(DtCriacao,1,10) AS dtdia,
    count(idCliente) as cadastro
FROM clientes
GROUP BY dtdia
),
tb_acumulado AS 
(
SELECT 
    *,
    sum(cadastro) OVER (ORDER BY dtdia) AS acumulado
FROM tb_cadastro_data
)

SELECT
    *
FROM tb_acumulado;
