/*
  ___   ___  _    
 |   \ / _ \| |   
 | |) | (_) | |__ 
 |___/ \__\_\____|
                  
  Orden jerárquico de evaluación de una consulta SELECT en SQL:
  
  (*) SELECT    - Se seleccionan las columnas o expresiones que se mostrarán.
  1. FROM      - Se especifican las tablas de las cuales se obtendrán los datos.
  2. JOIN      - Se realizan las uniones entre tablas si es necesario.
  3. WHERE     - Se filtran los registros antes de cualquier agrupación.
  4. GROUP BY  - Se agrupan los resultados por uno o más campos.
  5. HAVING    - Se filtran los grupos generados por el GROUP BY.
  6. SELECT    - Se seleccionan las columnas o expresiones que se mostrarán.
  7. ORDER BY  - Se ordenan los resultados finales.
  8. LIMIT     - Se limita la cantidad de filas que serán devueltas.

  Notas:
  
  	1. Aunque el SELECT aparece primero en la sintaxis de la consulta,
	  es evaluado después de las cláusulas FROM, JOIN, WHERE, GROUP BY, y HAVING.
	  por eso queda en el nivel 6
	  
	2. (*) obligatorio
	
	
	CONCEPTOS ELEMENTALES:
	
	Valor hardcodeado (hardcoded): es un dato que se inserta directamente en el código 
		fuente en lugar de obtenerse dinámicamente 
		
	Casteo (o casting): es el proceso de convertir un valor de un tipo de dato a otro 
		de manera explícita.
		
	Textos en base de datos se delimitan con comillas sencillas, eje 'mi texto'
		
	REFERENCIAS:
		tipos de datos: https://duckdb.org/docs/sql/data_types/overview.html
		select        : https://duckdb.org/docs/sql/statements/select.html
        tipos simples :  https://github.com/codingupmyfuture/bootcampduckdb/blob/main/contenido.curso/002.documentos/005.tipos.datos.simples.pdf
        tipos complex : https://github.com/codingupmyfuture/bootcampduckdb/blob/main/contenido.curso/002.documentos/006.tipos.datos.complejos.pdf
		
*/

-- 1. valor arcodeado |
-- 1.1 simmple 
SELECT 12345

-- 1.1 multiple 
SELECT 12345, 'mi texto'



--2. alias
--2.1 AS
 SELECT 12345 AS mi_valor, 'mi texto' AS texto_prueba;


--2.2 sin AS
 SELECT 12345 mi_valor, 'mi texto' texto_prueba;


-- 3. DESCRIBE  SELECT ..
DESCRIBE  SELECT 12345 mi_valor, 'mi texto' texto_prueba;


-- 4. CASTEO
/*
Operaciones básicas en SQL:

- Suma:          +
  Ejemplo: SELECT 5 + 3;  -- Resultado: 8

- Resta:         -
  Ejemplo: SELECT 10 - 4;  -- Resultado: 6

- Multiplicación: *
  Ejemplo: SELECT 7 * 2;  -- Resultado: 14

- División:      /
  Ejemplo: SELECT 20 / 5;  -- Resultado: 4
*/


SELECT 5 * 5 multiplicacion;

SELECT '5' * 5 interpretaciones;

SELECT '5' * '5' error; -- error por que texto por texto no puede ejecutarse


-- FORMAS DE CASTEAR
SELECT 
	INT'5' * INT'5' casteo_1,
	CAST('5' AS INT) * CAST('5' AS INT) casteo_2,
	'5'::INT * '5'::INT casteo_3;

