SELECT
    COUNT(DISTINCT substr(DtCriacao,1,10)) as DiasComTransacao,
    sum(QtdePontos) as TotalDePontos,
    sum(QtdePontos) / COUNT(DISTINCT substr(DtCriacao,1,10)) as MediaDePontos
FROM transacoes
WHERE 
    DtCriacao >= '2025-01-01' 
    AND DtCriacao < '2026-01-01';



