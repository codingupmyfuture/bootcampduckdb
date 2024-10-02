/*

  ___  ___  _    
 |   \|   \| |   
 | |) | |) | |__ 
 |___/|___/|____|

 Data Definition Language
 	- CREATE   : Crea nuevos objetos en la base de datos, como tablas, índices o vistas.
 	- ALTER    :  Modifica la estructura de un objeto existente, como agregar o eliminar columnas en una tabla.
 	- DROP     :  Elimina un objeto de la base de datos, como una tabla o índice.
 	- TRUNCATE : Elimina todos los registros de una tabla sin eliminar la tabla misma (lo veremos en DML)


 	REFERENCIAS:
 		esquemas     : https://github.com/codingupmyfuture/bootcampduckdb/blob/main/contenido.curso/002.documentos/003.esquemas.catalogos.pdf
 		transacciones: https://github.com/codingupmyfuture/bootcampduckdb/blob/main/contenido.curso/002.documentos/004.tipos.transacciones.pdf
 		

TRANSVERSALES:

*/


-- 1. comentarios de una sola linea

-- 2. comentarios múlti linea

/*
 * 2.
comentarios
de 
múltiples
lineas
*/


-- 3. show schemas | mostrara la bd por defecto a la que esta creando

SHOW DATABASES;

-- 4. crear esquemas | mostrara la bd por defecto a la que esta creando
-- referencia: https://duckdb.org/docs/sql/statements/create_schema.html


-- 4.1 elemental
CREATE SCHEMA demo1;


-- 4.2 recomendada
CREATE SCHEMA IF NOT EXISTS demo1;


-- 5. ubicarse en un esquemas |
-- referencias: https://duckdb.org/docs/sql/statements/use.html
--			    https://motherduck.com/docs/key-tasks/database-operations/switching-the-current-database/

-- 5.1 simple
USE demo1;

-- full ruta
USE training.main;

-- 6. mostrar esquema donde esta ubicado
SELECT current_schema();


-- 6. mostrar tablas
-- referencias: https://duckdb.org/docs/guides/meta/list_tables.html

-- 6.1 simple
SHOW TABLES;

-- 6.2 detallada
SHOW ALL TABLES;


-- 7. describir tabla
-- referencias: https://duckdb.org/docs/sql/statements/describe.html
DESCRIBE esquema.tabla;