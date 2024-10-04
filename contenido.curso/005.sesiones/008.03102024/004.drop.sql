
/*

  ___  ___  ___  ___ 
 |   \| _ \/ _ \| _ \
 | |) |   / (_) |  _/
 |___/|_|_\\___/|_|  
                     
        
	tablas.
	
	excelente practica, siempre agregar el esquema.objecto
	referencias: https://duckdb.org/docs/sql/statements/drop.html

*/

-- creación de esquema y tabla para la prueba
CREATE SCHEMA IF NOT EXISTS eliminaciones;
-- USE eliminaciones

CREATE TABLE IF NOT EXISTS eliminaciones.relacion( id SMALLINT PRIMARY KEY);  
CREATE TABLE IF NOT EXISTS eliminaciones.relacionado( id SMALLINT NOT NULL PRIMARY KEY REFERENCES eliminaciones.relacion(id)); 


-- 1. eliminar tabla
DROP TABLE eliminaciones.relacion;



-- 2. eliminación jerárquica
CREATE TABLE IF NOT EXISTS eliminaciones.relacion( id SMALLINT NOT  NULL PRIMARY KEY); 
CREATE TABLE IF NOT EXISTS eliminaciones.relacionado( id SMALLINT NOT NULL PRIMARY KEY REFERENCES eliminaciones.relacion(id)); 


DROP TABLE eliminaciones.relacion; -- generara error

/*
 PASOS:
 	1. eliminar las tablas relacionadas primero: DROP TABLE eliminaciones.relacionado;
 	2. eliminar la relacion                    : DROP TABLE eliminaciones.relacion;
*/

-- 3. eliminación esquema

--3.1 tambien es eliminación jerárquica, se debe eliminar todos los objetos y por ultimo el esquema
DROP SCHEMA eliminaciones;


--3.2 cascade ( eliminar jerárquias auto)
DROP SCHEMA eliminaciones CASCADE;