SELECT 
    EXTRACT(YEAR FROM dados.datetime) AS ano,
	estacoes.sg_estado,
    SUM(dados.precipitacao_total) AS soma_acumulada,
	AVG(dados.precipitacao_total) AS media
FROM
    dados_meteorologicos dados
JOIN
    estacoes ON dados.id_estacao = estacoes.cd_estacao
WHERE
	estacoes.sg_estado IN ('MG', 'SP', 'RJ', 'ES')
GROUP BY 
    EXTRACT(YEAR FROM dados.datetime), estacoes.sg_estado
ORDER BY 
    EXTRACT(YEAR FROM dados.datetime);