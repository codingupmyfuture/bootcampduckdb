--TYPE: texto
-- referencia: https://duckdb.org/docs/sql/functions/char.html
-- valor: DeMo@SofTSeRvEiNc.CoM o MiMAMAmemima@gmail.com

CREATE TABLE test (email VARCHAR NOT NULL);
INSERT INTO test VALUES ('DeMo@SofTSeRvEiNc.CoM'), ('MiMAMAmemima@gmail.com');
-- PARA PROBAR : SELECT FUNCION(ATRIBUTO) FROM test;




SELECT 'DeMo@SofTSeRvEiNc.CoM' email


-- mins.
SELECT LOWER('DeMo@SofTSeRvEiNc.CoM') email

-- mays.
SELECT UPPER('DeMo@SofTSeRvEiNc.CoM') email


-- longitud.
SELECT LENGTH ('DeMo@SofTSeRvEiNc.CoM') email


-- concatenar | A
SELECT 'DeMo@SofTSeRvEiNc.CoM' || '-' || '********' email

 -- concatenar | B
SELECT CONCAT('DeMo@SofTSeRvEiNc.CoM', '-', '********') email


 -- concatenar | c
SELECT CONCAT_WS('[-]', 'DeMo@SofTSeRvEiNc.CoM', '-', '********') email

-- trim
SELECT '   DeMo@SofTSeRvEiNc.CoM     ' email
SELECT TRIM('   DeMo@SofTSeRvEiNc.CoM     ') email


-- reverse 
SELECT REVERSE('DeMo@SofTSeRvEiNc.CoM') email

-- concatenación de operaciones
SELECT LOWER(REVERSE('DeMo@SofTSeRvEiNc.CoM')) email


-- replace 
SELECT REPLACE('DeMo@SofTSeRvEiNc.COM',  'o', '+') email

-- mejor practica
SELECT REPLACE(LOWER('DeMo@SofTSeRvEiNc.COM'),  'o', '+') email


-- repetir varias veces el mismo texto
SELECT REPEAT('DeMo@SofTSeRvEiNc.CoM', 2) AS email;

-- validar si una parte del texto esta dentro del atributo
SELECT CONTAINS('c:/ruta/archivo/bootcamp.pdf', 'ruta') ruta

-- validar si el archivo termina en un valor determinado
SELECT ENDS_WITH('c:/ruta/archivo/bootcamp.pdf', 'pdf') ruta
SELECT ENDS_WITH('c:/ruta/archivo/bootcamp.pdf', 'csv') ruta

-- convertir a base 64
SELECT BASE64('DeMo@SofTSeRvEiNc.CoM') encriptacion_basica

-- base 64 a texto
SELECT FROM_BASE64('RGVNb0BTb2ZUU2VSdkVpTmMuQ29N')::VARCHAR desencriptacion_basica

--  desencriptacion_md5
SELECT MD5('DeMo@SofTSeRvEiNc.CoM') encriptacion_media

-- idetificar
SELECT HASH('DeMo@SofTSeRvEiNc.CoM', 1) encriptacion_media


/*
Un slice es una técnica que permite extraer una subsección de un texto,
Usa la notación [start:end], donde:

start: es el índice desde donde comienza el slice.
end: es el índice donde termina el slice.


HOLA
[H  |  O |  L  |  A] -- ver texto como un vector
[1  |  2 |  3  |  4] -- postivo
[-4 | -3 | -2  | -1] -- negativa

 */

-- tomando posición del index
SELECT 'HOLA'[1] indice


-- tomando rango cerrado
SELECT 'HOLA'[1:3] rango_cerrado

-- tomando rango abierto final
SELECT 'HOLA'[2:] rango_abierto


-- tomando rango abierto inicial
SELECT 'HOLA'[:3] rango_abierto

-- tomando indice negativo
SELECT 'HOLA'[-2] indice_negativo


-- rangos negativos
SELECT 'HOLA'[-2:] rango_negativo