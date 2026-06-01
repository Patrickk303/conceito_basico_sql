SELECT
    Count(*) AS NumeroDeVendasLovers
FROM transacao_produto AS t
INNER JOIN produtos AS p ON t.IdProduto = p.IdProduto
INNER JOIN transacoes AS tr ON t.IdTransacao = tr.IdTransacao
WHERE 
    tr.DtCriacao >= '2024-01-01'
    AND tr.DtCriacao < '2025-01-01'
    AND p.DescCategoriaProduto = 'lovers'








SELECT *
FROM transacao_produto
LIMIT 2;

SELECT *
FROM produtos
LIMIT 2;

SELECT *
FROM transacoes
LIMIT 2;