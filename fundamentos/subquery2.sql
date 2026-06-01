SELECT count(DISTINCT IdCliente)
FROM transacoes as t
WHERE t.idCliente IN(
    SELECT DISTINCT idCliente
    FROM transacoes
    WHERE substr(DtCriacao, 1,10) = '2025-08-25'
)
AND substr(t.DtCriacao,1,10) = '2025-08-29';


SELECT count(DISTINCT idCliente)
FROM transacoes
WHERE substr(DtCriacao, 1,10) = '2025-08-25';
