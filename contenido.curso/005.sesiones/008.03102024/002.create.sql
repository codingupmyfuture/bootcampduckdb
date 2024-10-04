
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



-- 7. crear NULL y NOT  NULL
CREATE TABLE demo1.ejemplo_1_null(
	valor_vacio SMALLINT, -- null
	valor_vacio_2 VARCHAR(1) NULL, -- recomendado
	valor_no_vacio VARCHAR NOT NULL
); 



-- 8. valores default
CREATE TABLE demo1.ejemplo_2_default(
	valor_vacio SMALLINT NULL DEFAULT 1,
	valor_no_vacio SMALLINT NOT NULL DEFAULT 90
); 



-- 9. valores checks
CREATE TABLE demo1.ejemplo_3_check(
	--activo VARCHAR NULL CHECK (NOT contains(activo, ' ')) , -- conbinar con funciones | se verá en sección de DQL que es
	activo_no_vacio VARCHAR CHECK (activo_no_vacio IN ('S', 'N')) NOT NULL  
); 


-- 8. valores unique
CREATE TABLE demo1.ejemplo_4_unique(
	valor_no_vacio SMALLINT NOT NULL UNIQUE
); 




-- 8. valores PK

-- 8.1 en columna
CREATE TABLE demo1.ejemplo_5_pk(
	id_usuario INT NOT NULL PRIMARY KEY,
	nombre_usuario VARCHAR NOT NULL
); 


-- 8.2 al final
CREATE TABLE demo1.ejemplo_6_pk(
	id_usuario INT NOT NULL,
	nombre_usuario VARCHAR NOT NULL,
	PRIMARY KEY (id_usuario)
); 


-- 8.3 compuesta
CREATE TABLE demo1.ejemplo_7_pk(
	id_usuario INT NOT NULL,
	id_curso SMALLINT NOT NULL,
	PRIMARY KEY (id_usuario, id_curso)
);
	
	


-- 9. valores FK


-- tabla a relacionar
CREATE TABLE demo1.tipo_documento(
	id_tipo_documento SMALLINT NOT NULL,
	nombre_documento VARCHAR NOT NULL,
	activo VARCHAR  NOT NULL CHECK (activo IN ('S', 'N')),
	PRIMARY KEY (id_tipo_documento)
); 


-- 9.1 referencia | 1:N
CREATE TABLE demo1.usuarios_fk_ejemplo(
	id_usuario INT NOT NULL PRIMARY KEY, 
	nombre_usuario VARCHAR NOT NULL,
	id_tipo_documento SMALLINT NOT NULL REFERENCES demo1.tipo_documento(id_tipo_documento),
); 

-- 9.1 referencia | 1:1
CREATE TABLE demo1.ejemplo_9_fk(
	id_usuario INT NOT NULL PRIMARY KEY REFERENCES demo1.usuarios_fk_ejemplo(id_usuario),
	nro_ingreso_sesion INT NOT NULL
); 


