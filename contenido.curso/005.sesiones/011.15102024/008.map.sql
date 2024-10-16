--TYPE: map
-- referencia: https://duckdb.org/docs/sql/data_types/map
--             https://duckdb.org/docs/sql/expressions/logical_operators.html
-- obtener la longitud
-- definir map
SELECT MAP {
	'nombre': 'bootcamp', 
	'empresa': 'softserve', 
	'edad_profe': '19'
} resultado;


-- obtener valor por indice
SELECT MAP {
	'nombre': 'bootcamp', 
	'empresa': 'softserve', 
	'edad_profe': '19'
} resultado;

-- mandando lista de columnas y valores por separado
SELECT MAP(
	['nombre', 'empresa', 'edad_profe'],
	['bootcamp', 'softserve', '19']
) resultado;

-- usando función
SELECT map_from_entries(
	[
		('nombre', 'bootcamp'),
		('empresa', 'softserve'),
		('edad_profe', '19')
	]
) resultado;


-- obtener losd datos

SELECT MAP {
	'nombre': 'bootcamp', 
	'empresa': 'softserve', 
	'edad_profe': '19'
}['empresa'] resultado;

-- definir listas [latitud, longitud]
SELECT MAP { 
	'udea': [6.267264001455956, -75.56917754648963],
	'unal': [6.260911508487612, -75.5795386134807]
} resultado


-- obtener la longitud
SELECT MAP { 
	'udea': [6.267264001455956, -75.56917754648963],
	'unal': [6.260911508487612, -75.5795386134807]
}['udea'][1][1] resultado
