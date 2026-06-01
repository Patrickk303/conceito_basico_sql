
-- WITH tb_transacoes AS (

-- SELECT 
--     IdTransacao,
--     idCliente,
--     QtdePontos,
--     datetime(substr(DtCriacao,1,19)) AS DtCriacao,
--     julianday('{date}') - julianday(substr(DtCriacao,1,10)) AS diffDate,
--     CAST (strftime('%H', substr(DtCriacao,1,19)) AS INT ) AS HoraDia
-- FROM transacoes
-- WHERE dtCriacao < '{date}'
-- ),
-- tb_clientesdt AS (

-- SELECT
--     idCliente,
--     datetime(substr(DtCriacao,1,19)) AS DtCriacao,
--     cast(julianday('now') - julianday(substr(DtCriacao,1,19)) AS int) AS idadedia,
--     cast(julianday('now') - julianday(substr(DtCriacao,1,19)) AS int) / 365 AS idadebase,
--     qtdePontos
-- FROM clientes
-- ),

-- tb_sumairo_trans AS (
-- SELECT 
--     idCliente,
--     count(*) AS qtedtransVIDA,
--     count(CASE WHEN diffDate <= 7 THEN IdTransacao END) AS qtdeTransd7,
--     count(CASE WHEN diffDate <= 14 THEN IdTransacao END) AS qtdeTransd14,
--     count(CASE WHEN diffDate <= 28 THEN IdTransacao END) AS qtdeTransd28,
--     count(CASE WHEN diffDate <= 100 THEN IdTransacao END) AS qtdeTransd100,
--     CAST(MIN(diffDate) AS INT) AS UltDia,
--     sum(CASE WHEN qtdePontos > 0 THEN qtdePontos END) AS QtdePontosPosVida,
--     sum(CASE when qtdePontos > 0 AND diffdate <= 7 THEN qtdePontos ELSE 0 END) AS qtdePontos7,
--     sum(CASE when qtdePontos > 0 AND diffdate <= 14 THEN qtdePontos ELSE 0 END) AS qtdePontos14,
--     sum(CASE when qtdePontos > 0 AND diffdate <= 28 THEN qtdePontos ELSE 0 END) AS qtdePontos28,
--     sum(CASE when qtdePontos > 0 AND diffdate <= 56 THEN qtdePontos ELSE 0 END) AS qtdePontos56,
--     sum(CASE WHEN qtdePontos < 0 THEN qtdePontos END) AS QtdePontosNEGVida,
--     sum(CASE WHEN qtdePontos < 0 and diffdate <= 7 THEN qtdePontos ELSE 0 END) AS qtdePontosNeg7,
--     sum(CASE WHEN qtdePontos < 0 and diffdate <= 14 THEN qtdePontos ELSE 0 END) AS qtdePontosNeg14,
--     sum(CASE WHEN qtdePontos < 0 and diffdate <= 28 THEN qtdePontos ELSE 0 END) AS qtdePontosNeg28,
--     sum(CASE WHEN qtdePontos < 0 and diffdate <= 56 THEN qtdePontos ELSE 0 END) AS qtdePontosNeg56

-- FROM tb_transacoes
-- GROUP BY idCliente
-- ),

-- tb_transacoes_produto AS (
-- SELECT
--     t1.*,
--     t3.DescNomeProduto,
--     T3.DescCategoriaProduto
-- FROM tb_transacoes AS t1
-- LEFT JOIN transacao_produto AS t2
-- on t1.IdTransacao = t2.IdTransacao
-- LEFT JOIN produtos AS t3
-- ON t2.IdProduto = t3.IdProduto
-- ),

-- tb_cliente_produto AS (
-- SELECT 
--     idCliente,
--     DescNomeProduto,
--     count(*) AS QtdeVida,
--     count(CASE WHEN diffDate <= 7 THEN DescNomeProduto END) AS Qtded7,
--     count(CASE WHEN diffDate <= 14 THEN DescNomeProduto END) AS Qtded14,
--     count(CASE WHEN diffDate <= 28 THEN DescNomeProduto END) AS Qtded28,
--     count(CASE WHEN diffDate <= 56 THEN DescNomeProduto END) AS Qtded56
-- FROM tb_transacoes_produto
-- GROUP BY IdCliente, DescNomeProduto
-- ),


-- tb_cliente_produto_rn AS (
-- SELECT 
--     *,
--     row_number() OVER (PARTITION BY idCliente ORDER BY QtdeVida DESC) AS rnVida,
--     row_number() OVER (PARTITION BY idCliente ORDER BY Qtded7 DESC) AS rnd7,
--     row_number() OVER (PARTITION BY idCliente ORDER BY Qtded14 DESC) AS rnd14,
--     row_number() OVER (PARTITION BY idCliente ORDER BY Qtded28 DESC) AS rnd28,
--     row_number() OVER (PARTITION BY idCliente ORDER BY Qtded56 DESC) AS rnd56
-- FROM tb_cliente_produto
-- ),

-- tb_clientes_dia AS (
-- SELECT 
--     idCliente,
--     strftime('%w', DtCriacao) AS dtdia,
--     count(*) AS DiaAtv
-- FROM tb_transacoes
-- WHERE diffDate <= 100 -- não tem dado pra 28 dias
-- GROUP BY idCliente, dtdia
-- ),

-- tb_cliente_dia_rn AS (

-- SELECT
--     *,
--     ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY DiaAtv DESC) AS RankDia
-- FROM tb_clientes_dia

-- ),


-- tb_cliente_periodo AS (
-- SELECT 
--     idCliente,
--     CASE
--         WHEN HoraDia BETWEEN 7 and 12 THEN 'MANHÃ'
--         WHEN HoraDia BETWEEN 13 and 18 THEN 'TARDE'
--         WHEN HoraDia BETWEEN 19 and 23 THEN 'NOITE'
--         WHEN HoraDia BETWEEN 00 and 6 THEN 'MADRUGADA'
--     ELSE 'SEM INFORMAÇÃO'
--     END AS TURNO,
--     count(*) AS QtdeTurno
-- FROM tb_transacoes
-- WHERE diffdate <= 100 -- sem informação para d28
-- GROUP BY 1,2
-- ),

-- tb_cliente_periodo_rank AS (
-- SELECT 
--     *,
--     row_number() OVER (PARTITION BY idCliente ORDER BY QtdeTurno DESC) AS RanKTurno
-- FROM tb_cliente_periodo
-- ),


-- tb_join AS (
-- SELECT
--     t1.*,
--     t2.idadeBase,
--     t3.DescNomeProduto AS produtosVida,
--     t4.DescNomeProduto AS produtosv7,
--     t5.DescNomeProduto AS produtosv14,
--     t6.DescNomeProduto AS produtosv28,
--     t7.DescNomeProduto AS produtosv56,
--     coalesce(t8.dtdia, -1) AS dtdia,
--     coalesce(t9.turno, 'Sem resultado') AS TurnoD100
-- FROM tb_sumairo_trans AS t1
-- LEFT JOIN tb_clientesdt AS t2
-- on t1.idCliente = t2.idCliente


-- LEFT JOIN tb_cliente_produto_rn AS t3
-- on t3.idCliente = t1.idCliente
-- and t3.rnvida = 1

-- LEFT JOIN tb_cliente_produto_rn AS t4
-- on t4.idCliente = t1.idCliente and t4.rnd7 = 1

-- LEFT JOIN tb_cliente_produto_rn AS t5
-- on t5.idCliente = t1.idCliente
-- and t5.rnd14 = 1

-- LEFT JOIN tb_cliente_produto_rn AS t6
-- on t6.idCliente = t1.idCliente
-- and t6.rnd28 = 1

-- LEFT JOIN tb_cliente_produto_rn AS t7
-- on t7.idCliente = t1.idCliente
-- and t7.rnd56 = 1

-- LEFT JOIN tb_cliente_dia_rn AS t8
-- on t8.idCliente = t1.idCliente
-- and t8.RankDia = 1

-- LEFT JOIN tb_cliente_periodo_rank AS t9
-- ON t9.idCliente = t1.idCliente
-- AND t9.RanKTurno = 1
-- )


-- SELECT
--     '{date}' AS dtRef,
--     *,
--     1. * qtdeTransd100 / qtedtransVIDA AS qtdetransd100
-- FROM tb_join



SELECT *
FROM feature_store_cliente
ORDER BY idCliente, dtRef