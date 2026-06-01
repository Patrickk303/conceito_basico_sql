

DELETE FROM relatorio_diario
WHERE strftime('w%', dtdia) = '0';

SELECT *
FROM relatorio_diario
WHERE strftime('w%', dtdia) = '0';