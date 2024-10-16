/*
  ___ ___  ___  __  __ 
 | __| _ \/ _ \|  \/  |
 | _||   / (_) | |\/| |
 |_| |_|_\\___/|_|  |_|
 
 tablas.
	
	excelente practica, siempre agregar el esquema.objecto

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
*/

USE parranda;

-- asterisco (*) : traer todas las columnas (seleccionar todos los atributos)

SELECT *
FROM parranda.usuarios;

DESCRIBE parranda.usuarios;

-- seleccionar atributos 
SELECT activo,
identificacion, 
id_usuario,
FROM parranda.usuarios;

-- seleccionar y harcodear | mala practica
SELECT 'bootcamp' tipo,
'duckdb' curso, 
*
FROM parranda.usuarios;


-- buena practica
SELECT 'bootcamp' tipo,
    'duckdb' curso, 
    identificacion,
    primer_nombre,
    segundo_nombre,
    primer_apellido,
    segundo_apellido,
    telefono,
    id_genero_persona,
    activo 
FROM parranda.usuarios;


-- alias, util cuando se relacionan tablas
SELECT usr.activo,
	usr.identificacion, 
	usr.id_usuario,
FROM parranda.usuarios usr;


-- limites: buena practica para tomar muestras
SELECT *
FROM parranda.usuarios
LIMIT 5;

-- ordenamiento: ASC,DESC. SQL:
SELECT 
id_usuario,
identificacion,
id_genero_persona
FROM parranda.usuarios
;

-- forma 1 |
SELECT 
id_usuario,
identificacion,
id_genero_persona
FROM parranda.usuarios
ORDER BY id_genero_persona; -- agregar ASC es redundante, por defecto 

-- forma 2 |
SELECT 
id_usuario,
identificacion,
id_genero_persona
FROM parranda.usuarios
ORDER BY 3;

-- forma transversal DESC |
SELECT 
id_usuario,
identificacion,
id_genero_persona
FROM parranda.usuarios
ORDER BY 3 DESC;


-- multiples ordenamiento por nombre y index columna |
SELECT 
id_usuario,
identificacion,
id_genero_persona
FROM parranda.usuarios
ORDER BY identificacion, 3 DESC;


-- funciones generales

-- funciones generales de agregación | PARTE 1
SELECT 
    -- calcula la suma total de los valores en la columna id_genero_persona.
    SUM(id_genero_persona) AS suma_genero,

    -- calcula el promedio de los valores en la columna id_genero_persona.
    AVG(id_genero_persona) AS average_genero,

    -- cuenta el número total de registros en la tabla, considerando solo la columna id_genero_persona.
    -- forma 1
    COUNT(id_genero_persona) AS total_count_1,

    -- forma 2
    COUNT(*) AS total_count_2,

    -- forma 3 | recomendada
    COUNT(1) AS total_count_3,

    -- devuelve el valor máximo encontrado en la columna id_genero_persona.
    MAX(id_genero_persona) AS max_genero,

    -- devuelve el valor mínimo encontrado en la columna id_genero_persona.
    MIN(id_genero_persona) AS min_genero

FROM parranda.usuarios;





-- devuelve una lista de valores únicos de la columna id_genero_persona, eliminando los duplicados.
SELECT DISTINCT(id_genero_persona) AS unique_generos
FROM parranda.usuarios;


-- case: es condicional

-- forma 1

SELECT 
    id_genero_persona,
    CASE id_genero_persona
        WHEN 1 THEN 'hombre'
        WHEN 2 THEN 'mujer'
        WHEN 3 THEN 'otro'
        ELSE 'desconocido'
    END AS genero
FROM parranda.usuarios;
    
   
-- forma #2
SELECT 
    id_genero_persona,
    CASE 
        WHEN id_genero_persona = 1 THEN 'hombre'
        WHEN id_genero_persona = 2 THEN 'mujer'
        WHEN id_genero_persona = 3 THEN 'otro'
        ELSE 'desconocido'
    END AS genero
FROM parranda.usuarios;


-- recordar y profindizar en AND: es excluyente

SELECT 
    ur.id_genero_persona,
    CASE 
        WHEN ur.id_genero_persona = 1 THEN 'hombre'
        WHEN ur.id_genero_persona = 2 THEN 'mujer'
        WHEN ur.id_genero_persona = 3 THEN 'otro'
        ELSE 'desconocido'
    END AS genero
FROM parranda.usuarios ur
WHERE id_genero_persona = 1
--AND id_genero_persona = 2;

-- uso del OR
-- normalmente atributos diferentes
SELECT 
    ur.id_genero_persona,
    CASE 
        WHEN ur.id_genero_persona = 1 THEN 'hombre'
        WHEN ur.id_genero_persona = 2 THEN 'mujer'
        WHEN ur.id_genero_persona = 3 THEN 'otro'
        ELSE 'desconocido'
    END AS genero
FROM parranda.usuarios ur
WHERE id_genero_persona = 1 OR
	  id_genero_persona = 2;
	  

-- organizar los or's en parentesis	 
SELECT 
    ur.id_genero_persona,
    CASE 
        WHEN ur.id_genero_persona = 1 THEN 'hombre'
        WHEN ur.id_genero_persona = 2 THEN 'mujer'
        WHEN ur.id_genero_persona = 3 THEN 'otro'
        ELSE 'desconocido'
    END AS genero
FROM parranda.usuarios ur
WHERE (id_genero_persona = 1 OR id_genero_persona = 2); -- puede ser un in
