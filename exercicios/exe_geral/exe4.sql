-- Clientes mais antigos tem mais frequencia de transação?
SELECT
    count(DISTINCT t.idCliente),
    substr(t.DtCriacao,1,4) AS Data
FROM transacoes AS t
INNER JOIN transacao_produto AS tp
ON t.IdTransacao = tp.IdTransacao 
WHERE
    tp.IdProduto = 11
GROUP BY Data


-- Query correta

SELECT
    c.idCliente,
    substr(c.DtCriacao,1,4),
    CAST(julianday('now') AS INT) - CAST(julianday(substr(c.DtCriacao, 1, 10)) AS INT) AS IdadeBase,
    count(c.idCliente)  AS Numero_De_Transações
FROM clientes c
LEFT JOIN transacoes t
ON c.IdCliente = t.IdCliente
GROUP BY t.idCliente, IdadeBase
