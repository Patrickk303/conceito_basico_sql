SELECT 
    t1.IdProduto,
    t2.DescCategoriaProduto,
    count(t1.IdProduto) AS NumeroDeVendas
FROM transacao_produto t1
LEFT JOIN produtos t2 ON t1.IdProduto = t2.IdProduto
WHERE t2.DescCategoriaProduto is not null
GROUP BY t1.IdProduto
ORDER BY NumeroDeVendas DESC
LIMIT 10;

