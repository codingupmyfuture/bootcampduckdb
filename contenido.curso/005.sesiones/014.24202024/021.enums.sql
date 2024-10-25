/*

  ___ _  _ _   _ __  __ 
 | __| \| | | | |  \/  |
 | _|| .` | |_| | |\/| |
 |___|_|\_|\___/|_|  |_|


    referencias: https://duckdb.org/docs/sql/statements/create_macro.html

El tipo de dato enum en bases de datos se utiliza para definir una lista de 
valores posibles para una columna, como si fuera un "diccionario" que contiene 
todas las opciones únicas que esa columna puede tener. Es como una lista predefinida 
de valores permitidos, y cada valor en esa lista es único.  
*/
CREATE SCHEMA IF NOT EXISTS enumeradores;
USE enumeradores;

CREATE TYPE genero AS ENUM ('hombre', 'mujer', 'otro');



CREATE TABLE IF NOT EXISTS enumeradores.persona(
	nombre_persona VARCHAR NOT NULL,
	genero_persona genero NOT NULL
);


INSERT INTO enumeradores.persona VALUES ('softserve', 'otro');
INSERT INTO enumeradores.persona VALUES ('softserve', 'hombre');
INSERT INTO enumeradores.persona VALUES ('softserve', 'mujer');

-- no valores
INSERT INTO enumeradores.persona VALUES ('softserve', 'profesor');