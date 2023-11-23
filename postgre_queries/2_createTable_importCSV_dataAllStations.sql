CREATE TABLE dados_meteorologicos(
	id_estacao TEXT,
    estacao TEXT,
    datetime TIMESTAMP,
    precipitacao_total FLOAT,
    pressao_atmosferica FLOAT,
    pressao_atmosferica_max FLOAT,
    pressao_atmosferica_min FLOAT,
    radiacao_global FLOAT,
    temperatura_ar_bulbo_seco FLOAT,
    temperatura_ponto_orvalho FLOAT,
    temperatura_maxima FLOAT,
    temperatura_minima FLOAT,
    temperatura_orvalho_max FLOAT,
    temperatura_orvalho_min FLOAT,
    umidade_rel_max FLOAT,
    umidade_rel_min FLOAT,
    umidade_relativa_ar FLOAT,
    vento_direcao FLOAT,
    vento_rajada_max FLOAT,
    vento_velocidade FLOAT,
	FOREIGN KEY (id_estacao) REFERENCES estacoes(cd_estacao)
	-- Chave estrangeira apontando para a chave primária das estações
	-- Observar que a coluna é criada sparadamente, e somente depois apontada como chave estrangeira
);

COPY dados_meteorologicos(id_estacao, estacao, datetime, precipitacao_total, pressao_atmosferica, pressao_atmosferica_max, pressao_atmosferica_min, radiacao_global, temperatura_ar_bulbo_seco, temperatura_ponto_orvalho, temperatura_maxima, temperatura_minima, temperatura_orvalho_max, temperatura_orvalho_min, umidade_rel_max, umidade_rel_min, umidade_relativa_ar, vento_direcao, vento_rajada_max, vento_velocidade)
FROM 'C:/precipitacao_SE_Brasil_2010_2022/data_stations/preprocessed_data/all_stations_filtered.csv' DELIMITER ',' CSV HEADER;

/*IMPORTANTE! ao realizar a importação usando COPY, o PostgreSQL espera que o arquivo
esteja acessível do ponto de vista do servidor PostgreSQL, não do cliente.
Por isso foi necessário colocar o csv dentro do disco C:\, não D:\ como geralmente utilizo.
*/




















