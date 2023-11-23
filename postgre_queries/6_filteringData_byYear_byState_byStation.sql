SELECT 
    EXTRACT(YEAR FROM dados.datetime) AS ano,
	estacoes.sg_estado,
    SUM(dados.precipitacao_total) AS soma_acumulada,
	AVG(dados.precipitacao_total) AS media,
	estacoes.geom
FROM
    dados_meteorologicos dados
JOIN
    estacoes ON dados.id_estacao = estacoes.cd_estacao
WHERE
	-- IMPORTANTE! A filtragem por ano permite maior felixibilidade na visualização dos dados, evitando múltiplas células com a mesma geometria
	estacoes.sg_estado IN ('MG', 'SP', 'RJ', 'ES') AND EXTRACT(YEAR FROM dados.datetime) = 2010
GROUP BY 
    EXTRACT(YEAR FROM dados.datetime), estacoes.sg_estado, estacoes.geom
ORDER BY 
    EXTRACT(YEAR FROM dados.datetime);