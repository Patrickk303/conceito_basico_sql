-- Quais clientes mais perderam pontos pro Lovers

SELECT 
    t1.idCliente,
    sum(t1.QtdePontos) AS SomaDePontos
FROM transacoes t1
INNER JOIN transacao_produto t2 on t1.IdTransacao = t2.IdTransacao
INNER JOIN produtos t3 on t2.IdProduto = t3.IdProduto
WHERE t3.DescCategoriaProduto = 'lovers'
GROUP BY t1.idCliente
ORDER BY SomaDePontos ASC