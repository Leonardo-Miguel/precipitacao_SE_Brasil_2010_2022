select
	estados.geom
from
	limite_estados_brasil estados
where
	estados.sigla in ('MG', 'SP', 'RJ', 'ES')