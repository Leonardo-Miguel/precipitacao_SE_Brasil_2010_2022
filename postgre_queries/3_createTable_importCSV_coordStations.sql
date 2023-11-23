CREATE TABLE estacoes (
    dc_nome TEXT,
    sg_estado TEXT,
    cd_situacao TEXT,
    vl_latitude FLOAT,
    vl_longitude FLOAT,
    vl_altitude FLOAT,
    dt_inicio_operacao TIMESTAMP,
    cd_estacao TEXT PRIMARY KEY,
    FOREIGN KEY (sg_estado) REFERENCES limite_estados_brasil(sigla)
    /* Como na tabela de dados não há referência espacial, nem ao estado da estação, 
    então será feito o link entre a tabela com os estados e a estação, e através dessa conexão,
    realizar a conexão dos dados com a geometria dos estados 
    */
);

COPY estacoes FROM 'C:/precipitacao_SE_Brasil_2010_2022/info_stations/station_info_preprocessed.csv' DELIMITER ',' CSV HEADER;

-- Agora será feita a conversão dos dados lidos como float (colunas latitude e longitude) para tipo geography

-- Criação de uma nova coluna do tipo POINT
ALTER TABLE estacoes ADD COLUMN geom GEOGRAPHY(Point, 4326);

-- Atualização da nova coluna usando os valores da coluna FLOAT
UPDATE estacoes SET geom = ST_SetSRID(ST_MakePoint(vl_longitude, vl_latitude), 4326);

-- Exclusão da colunas (FLOATS) que não serão mais necessárias
ALTER TABLE estacoes DROP COLUMN vl_latitude;
ALTER TABLE estacoes DROP COLUMN vl_longitude;
