
/*

   ___ ___ ___   _ _____ ___ 
  / __| _ \ __| /_\_   _| __|
 | (__|   / _| / _ \| | | _| 
  \___|_|_\___/_/ \_\_| |___|

	tablas.
	
	excelente practica, siempre agregar el esquema.objecto

*/


-- 1. simple | recomendación: esquema.tabla
-- referencias: https://duckdb.org/docs/sql/statements/create_table.html

-- 1.1 simple | 
CREATE TABLE dbl1( aa VARCHAR(1)); 


-- 1.2 recomendado | aplicar esquema donde va a quedar almacenados
CREATE TABLE IF NOT EXISTS main.dbl1( aa VARCHAR(1)); 


-- 2. describir tabla

-- 2.1 simple
DESCRIBE dbl1;

-- 2.2 recomendado
DESCRIBE main.dbl1;


-- 3. agregar comentarios tabla

COMMENT ON TABLE main.dbl1 IS 'nuestra primera tabla';

-- 4. agregar comentarios tabla
COMMENT ON COLUMN main.dbl1.aa IS 'mi primera columna';


-- 5. mirar comentarios de tablas
SELECT * FROM duckdb_tables();

-- 6. mirar comentarios de columnas
SELECT * FROM duckdb_columns();