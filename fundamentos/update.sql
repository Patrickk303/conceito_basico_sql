SELECT *
FROM relatorio_diario;


UPDATE relatorio_diario
SET qtdePontos = 1000000000
WHERE dtdia >= '2025-08-25';

SELECT *
FROM relatorio_diario;
