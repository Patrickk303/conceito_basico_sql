
 -- CTE: COMMON TABLE EXPRESSION






WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(dtCriacao,1,10) = '2025-08-25'

),
tb_cliente_ultimo_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(dtCriacao,1,10) = '2025-08-29'

),
tb_join AS (
SELECT 
    t1.idCliente As Cliente_Primeiro_Dia,
    t2.idCliente As Cliente_Ultimo_Dia
FROM tb_cliente_primeiro_dia t1
LEFT JOIN tb_cliente_ultimo_dia t2
ON t1.idCliente = t2.idCliente
)

SELECT 
    count(Cliente_Primeiro_Dia),
    count(Cliente_Ultimo_Dia)
FROM tb_join
