/*
Las funciones de agregación son herramientas en SQL que permiten realizar cálculos sobre un conjunto de 
datos y devolver un único valor. Se utilizan comúnmente en consultas para resumir o agrupar datos.

REGLAS:
    1. atributos + funciones de agrupación == GROUP BY
    2. los atributos tomados de tablas deben ser los mismos en el select y group by | por el momento
    3. usar having count = cuando se quiera filtrar datos agrupados
*/

-- contar el número total de usuarios por género
SELECT id_genero_persona, 
	   COUNT(1) AS total_usuarios
FROM parranda.usuarios
GROUP BY id_genero_persona;

-- grop by harcodeado
SELECT tt.vigencia, 
	   tt.mes, 
	   tt.dia, 
	   SUM(venta) ventas_totales
FROM (
	SELECT 2024 vigencia, 10 mes, 17 dia, 200 venta
	UNION ALL
	SELECT 2024 vigencia, 10 mes, 16 dia, 100 venta
	UNION ALL
	SELECT 2024 vigencia, 10 mes, 17 dia, 20 venta) tt
GROUP BY tt.vigencia, 
	   tt.mes, 
	   tt.dia,


-- sumar los totales por género
SELECT id_genero_persona, 
SUM(id_genero_persona) AS suma_generos
FROM parranda.usuarios
GROUP BY id_genero_persona;


-- promedio de por género
SELECT id_genero_persona, 
AVG(id_genero_persona) AS promedio_generos
FROM parranda.usuarios
GROUP BY id_genero_persona;

-- encontrar el genero mínimo de los usuarios por género
SELECT id_genero_persona, 
MIN(id_genero_persona) AS genero_minima
FROM parranda.usuarios
GROUP BY id_genero_persona;

-- encontrar el genero máxima de los usuarios por género
SELECT id_genero_persona, MAX(id_genero_persona) AS genero_maxima
FROM parranda.usuarios
GROUP BY id_genero_persona;

-- obtener múltiples agregaciones:
SELECT id_genero_persona,
    COUNT(1) AS total_genero,
    SUM(id_genero_persona) AS genero_sumatoria,
    AVG(id_genero_persona) AS genero_promedio,
    MIN(id_genero_persona) AS genero_minima,
    MAX(id_genero_persona) AS genero_maxima
FROM parranda.usuarios
GROUP BY id_genero_persona;

-- HAVING COUNT
-- el uso de HAVING COUNT(...) en SQL se emplea para filtrar grupos de resultados después de que se han aplicado las funciones de agregación.
SELECT id_genero_persona, 
	  COUNT(1) AS total_usuarios
FROM parranda.usuarios
GROUP BY id_genero_persona
HAVING COUNT(1) > 8
ORDER BY 2 DESC
;