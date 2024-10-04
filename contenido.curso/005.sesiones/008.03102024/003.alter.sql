/*
    _   _  _____ ___ ___ 
   /_\ | ||_   _| __| _ \
  / _ \| |__| | | _||   /
 /_/ \_\____|_| |___|_|_\
                                           
	tablas.
	
	excelente practica, siempre agregar el esquema.objecto
	referencias: https://duckdb.org/docs/sql/statements/alter_table.html

*/

-- creación de esquema y tabla para la prueba
CREATE SCHEMA IF NOT EXISTS alteraciones;
-- USE alteraciones

CREATE TABLE IF NOT EXISTS alteraciones.prueba( aa VARCHAR(1)); 

-- solo ejecutar, se verá en detalle cuando veamos DML
INSERT INTO alteraciones.prueba VALUES ('xyz');


-- ver resultados, se verá en detalle cuando veamos DML o DQLsz  

SELECT * FROM alteraciones.test
--------------------------------------------------------------


-- 1. renombrar tabla

ALTER TABLE alteraciones.prueba RENAME TO 'test';


-- 2. renombrar columna
ALTER TABLE alteraciones.test RENAME aa TO coords;


--  2.1 agregar columna
ALTER TABLE alteraciones.test ADD activo_null VARCHAR NULL;


--  2.2 agregar default
ALTER TABLE alteraciones.test ADD activo_null2 VARCHAR NULL DEFAULT 'AEIOU';


--  2.3 modificar default
ALTER TABLE alteraciones.test ALTER activo_null2 SET DEFAULT 'UOIEA';


--  2.4 eliminar default
ALTER TABLE alteraciones.test ALTER activo_null2 DROP DEFAULT;


--  2.5  null default
ALTER TABLE alteraciones.test ADD activo VARCHAR DEFAULT 'N';


--  2.6  pasar a not null
ALTER TABLE alteraciones.test ALTER COLUMN activo SET NOT NULL; -- column es opcional | redundante


--  2.6.1 pasar de not null a null
ALTER TABLE alteraciones.test ALTER activo DROP NOT NULL;

--  2.7  pasar a otro tipo dde datos
ALTER TABLE alteraciones.test ALTER activo_null TYPE DATE;


--  2.8  eliminar columna
ALTER TABLE alteraciones.test DROP activo_null2;
