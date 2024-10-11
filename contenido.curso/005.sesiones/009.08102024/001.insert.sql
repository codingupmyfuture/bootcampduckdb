
/*
  ___ _  _ ___ ___ ___ _____ 
 |_ _| \| / __| __| _ \_   _|
  | || .` \__ \ _||   / | |  
 |___|_|\_|___/___|_|_\ |_|  

	tablas.
	excelente practica, siempre agregar el esquema.objecto

    referencias: https://duckdb.org/docs/sql/statements/insert.html
*/

-- crear el esquema
CREATE SCHEMA IF NOT EXISTS dml;

-- crear tablas 
CREATE TABLE IF NOT EXISTS dml.test_inserts(
    id_tipo SMALLINT NOT NULL PRIMARY KEY,
    descripcion VARCHAR NOT NULL,
    alias VARCHAR NULL,
    alien BOOLEAN,
    activo VARCHAR NOT NULL DEFAULT 'S'
);

- describir como esta la tabla
DESCRIBE dml.test_inserts;

-- validar resultados
SELECT * FROM dml.test_inserts

-- forma insert # 1 | todas las columnas | redundante
-- indicar las columnas que se van a insertar
INSERT INTO dml.test_inserts(
	id_tipo,
	descripcion,
	alias,
	alien,
	activo
) VALUES (
1,
'PRIMER INSERT',
'PI',
false,
'S'
);

-- forma insert # 2 | todas las columnas | recomendada
INSERT INTO dml.test_inserts VALUES (2,'PRIMER INSERT','PI',false,'S');


-- forma para evitar que generer errores de PK o unique
INSERT OR IGNORE INTO dml.test_inserts VALUES (2,'PRIMER INSERT','PI',false,'S');

-- forma para evitar que generer errores de PK  y remplazar valor
INSERT OR REPLACE INTO dml.test_inserts VALUES (2,'SEGUNDO INSERT REMPLAZADO','PI',false,'S');


-- forma insert # 3 | insert parcial | orden
INSERT INTO dml.test_inserts(id_tipo, descripcion) VALUES (3, 'TERCERO');


-- forma insert # 4 | insert parcial | desorden
INSERT INTO dml.test_inserts(descripcion ,id_tipo ) VALUES ('DESORDEN', 4);

-- generara error
INSERT INTO dml.test_inserts(id_tipo) VALUES (5);

-- insertar multiples valores | total o parcial | ordinario | no recomendado
INSERT INTO dml.test_inserts VALUES (5,'VARIOS FORMA #1.1','VFO',TRUE,'N');
INSERT INTO dml.test_inserts VALUES (6,'VARIOS FORMA #1.2','VFO',TRUE,'N');
INSERT INTO dml.test_inserts VALUES (7,'VARIOS FORMA #1.3','VFO',TRUE,'N');

-- insertar multiples valores | total o parcial | eficiente | recomendado
INSERT INTO dml.test_inserts VALUES 
	(8,'VARIOS FORMA #2.1','VFO',TRUE,'N'),
	(9,'VARIOS FORMA #2.2','VFO',TRUE,'N'),
	(10,'VARIOS FORMA #2.3','VFO',TRUE,'N');


-- insert basico - intermedio 

CREATE TABLE IF NOT EXISTS dml.tmp_test_insert_select(
    id_tipo_xyz SMALLINT NOT NULL PRIMARY KEY,
    descripcion_anonima VARCHAR NOT NULL,
    activo_prueba VARCHAR NOT NULL
 );
 
 INSERT INTO dml.tmp_test_insert_select
 SELECT id_tipo,
	descripcion,
	activo
FROM dml.test_inserts;

SELECT * FROM dml.tmp_test_insert_select


-- insert basico - intermedio
CREATE TABLE dml.tmp_test_insert_create2 AS
 SELECT activo,
	descripcion,
	id_tipo,
	FLOOR(random() * 1000) + 1 salario -- campo aleatorío
FROM dml.test_inserts;