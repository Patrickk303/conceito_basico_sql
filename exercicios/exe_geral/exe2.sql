-- Query para entender a lógica do banco
SELECT *
FROM Produtos
GROUP by DescCategoriaProduto;

SELECT *
FROM transacao_produto
LIMIT 10;

SELECT *
FROM transacoes
LIMIT 10;

-- Quais clientes assinaram a lista de presença no dia 25/08/2025
SELECT
    t1.idCliente,
    substr(t1.DtCriacao, 1, 10) AS data,
    t3.IdProduto,
    t3.DescCategoriaProduto
FROM transacoes AS t1
LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto
WHERE 
    data = '2025-08-25'
    AND t2.IdProduto = 11;