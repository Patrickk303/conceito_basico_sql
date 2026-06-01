-- Do inicio ao fim do curso quantos assinaram a lista de presença?
SELECT 
    count(DISTINCT t2.idCliente) AS AssinaramPresença
FROM transacao_produto AS t1
INNER JOIN transacoes AS t2
ON t1.IdTransacao = t2.IdTransacao
INNER JOIN produtos AS t3
ON t1.IdProduto = t3.IdProduto
WHERE
    substr(t2.DtCriacao,1,10) >= '2025-08-25'
    AND substr(t2.DtCriacao,1,10) < '2025-08-30'
    AND t3.DescNomeProduto = 'Lista de presença'


 -- correção do professor
--  Erros da minha parte :
--  errei na logica dos inner join (correto era left join)
--  não precisava do subs subsstr
-- Errei da data

SELECT 
    count(DISTINCT IdCliente)
FROM transacoes AS t1
LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao
LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto
WHERE
    t1.DtCriacao >= '2025-08-25'
    AND t1.DtCriacao < '2025-08-30'
    AND t3.DescNomeProduto = 'Lista de presença'
