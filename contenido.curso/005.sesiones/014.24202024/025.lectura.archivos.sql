-- descargar archivos y cambiar ruta
SET VARIABLE datasets = '/Users/lvasq/labs/duckdb';
SET VARIABLE base_repo = 'https://raw.githubusercontent.com/codingupmyfuture/bootcampduckdb/refs/heads/main/contenido.curso/000.recursos/datasets'

-- lectura CSV
-- referencias: https://duckdb.org/docs/guides/file_formats/csv_import
--				https://duckdb.org/docs/data/csv/overview.html

-- directa
SELECT * FROM '/Users/lvasq/labs/duckdb/titanic.csv' 

-- función, recomendado para configurar delimitador, etc
SELECT * 
FROM read_csv('/Users/lvasq/labs/duckdb/titanic.csv' ,
    delim = ',',
    header = TRUE
);

-- desde variable
SELECT * FROM read_csv(CONCAT_WS('/', getvariable('datasets'), 'titanic.csv'))

-- lectura desde internet
SELECT * FROM 'https://raw.githubusercontent.com/codingupmyfuture/bootcampduckdb/refs/heads/main/contenido.curso/000.recursos/datasets/titanic.csv'

-- lectura desde internet con variable
SELECT * FROM read_csv(CONCAT_WS('/', getvariable('base_repo'), 'titanic.csv'))


-- lectura JSON - IMPORTANTE - estudiarlo
-- referencias: https://duckdb.org/docs/data/json/overview
INSTALL json;
LOAD json;


--	general
SELECT * FROM read_json(CONCAT_WS('/', getvariable('datasets'), 'tv_shows.json'))

-- seleccionando
SELECT tv.nombre,tv.tipo, tv.genero,  
tv.castin['name'] persona,
tv.castin['description'] rol,
FROM (
SELECT 
	tt.name nombre,
	tt.TYPE tipo,
	tt.genre genero,
	CAST(
		UNNEST(
			CAST(cast_and_crew AS VARCHAR[])
		) AS STRUCT(
			name VARCHAR,
			description VARCHAR
		)
	) castin -- desacoplar actores
FROM read_json(CONCAT_WS('/', getvariable('datasets'), 'tv_shows.json')) tt
) tv


-- lectura Excel 
-- referencias: https://duckdb.org/docs/data/json/overview
-- tener activado
-- INSTALL spatial;
-- LOAD spatial;

INSTALL spatial;
LOAD spatial;

--  si no se le pone, lee la primera tab
SELECT * FROM st_read(
	CONCAT_WS('/', getvariable('datasets'), 'parranda.xlsx')--,
	--layer = 'tab'
);

--  si no se le pone, lee la primera tab
SELECT * FROM st_read(
	CONCAT_WS('/', getvariable('datasets'), 'parranda.xlsx'),
	layer = 'musica'
);


-- lectura parquet 
-- referencias: https://duckdb.org/docs/data/json/overview
-- PARQUET == LO MAS USADO A NIVELES ALTOS Y MADUROS

-- directa
SELECT * FROM '/Users/lvasq/labs/duckdb/comunas_medellin.parquet'

-- usando función
SELECT * FROM read_parquet('/Users/lvasq/labs/duckdb/comunas_medellin.parquet')

-- ventajas
DESC SELECT * FROM '/Users/lvasq/labs/duckdb/comunas_medellin.parquet'


-- usando DDL

CREATE SCHEMA IF NOT EXISTS archivos;

CREATE TABLE  archivos.tmp_musica AS
SELECT fl."ID _MUSICA" id, 
fl."NOMBRE_ GENERO_MUSICA" genero
FROM st_read(
	CONCAT_WS('/', getvariable('datasets'), 'parranda.xlsx'),
	layer = 'musica'
) fl;


SELECT * FROM archivos.tmp_musica

-- usando DML

CREATE TABLE archivos.musica(
	id_genero_musical VARCHAR,
	nombre_genero_musical VARCHAR
);

INSERT INTO archivos.musica
	SELECT fl."ID _MUSICA" id, 
	fl."NOMBRE_ GENERO_MUSICA" genero
	FROM st_read(
		CONCAT_WS('/', getvariable('datasets'), 'parranda.xlsx'),
		layer = 'musica'
	) fl;

SELECT * FROM archivos.musica;


/*
IMPORTANTE:
    duck db soporta leer varios archivos al tiempo, mirar:
        https://duckdb.org/docs/data/multiple_files/overview.html
/*