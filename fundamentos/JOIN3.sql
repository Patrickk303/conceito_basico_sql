SELECT 
    DISTINCT substr(t3.DtCriacao, 1, 7) AS Data,
    Count(t1.IdProduto) AS NumeroDePresença
FROM produtos t1
LEFT JOIN transacao_produto t2 ON t1.IdProduto = t2.IdProduto 
LEFT JOIN transacoes t3 on t2.IdTransacao = t3.IdTransacao
WHERE 
    t1.DescNomeProduto = 'Lista de presença'
GROUP BY Data
ORDER BY NumeroDePresença DESC
