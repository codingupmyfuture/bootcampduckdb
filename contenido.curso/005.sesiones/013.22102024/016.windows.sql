
/*
 __      _____ _  _ ___   _____      __
 \ \    / /_ _| \| |   \ / _ \ \    / /
  \ \/\/ / | || .` | |) | (_) \ \/\/ / 
   \_/\_/ |___|_|\_|___/ \___/ \_/\_/  
                                       
    referencias: https://duckdb.org/docs/sql/functions/window_functions.html
*/


CREATE SCHEMA ventanas;

-- crear la tabla ventas_mes en el esquema ventanas
CREATE TABLE ventanas.ventas_mes (
    id_venta TINYINT PRIMARY KEY,
    mes VARCHAR(20),
    venta INT
);

-- insertar datos de ejemplo en la tabla ventas_mes
INSERT INTO ventanas.ventas_mes VALUES
    (1,'enero', 100),
    (2,'febrero', 200),
    (3,'marzo', 150),
    (4,'abril', 300),
    (5,'mayo', 250);


-- crear la tabla ventas_mes en el esquema ventanas
CREATE TABLE ventanas.ventas_usuarios (
    dia_venta TINYINT,
    nombre_usuario VARCHAR(20),
    valor_venta INT
);

-- insertar datos de ejemplo en la tabla ventas_usuarios
INSERT INTO ventanas.ventas_usuarios VALUES
    (10,'Pepito', 5),
    (11,'Julanito', 2),
    (15,'Pepito', 3),
    (17,'Pepito', 1);


-- NOTA no es GROUP BY
SELECT 'originales' categoria,
    mes,
    venta ventas
FROM ventanas.ventas_mes
UNION ALL
SELECT 
	'agrupados' categoria,
    mes,
    SUM(venta) ventas,
FROM ventanas.ventas_mes
GROUP BY categoria, mes
UNION ALL
SELECT 
	'ventana' categoria,
    mes,
    SUM(venta) OVER (ORDER BY mes) ventas,
FROM ventanas.ventas_mes
;

-- calcular el total acumulado de ventas usando una window function por orden de los registros
SELECT 
	id_venta,
	mes,
    venta,
    SUM(venta) OVER (ORDER BY id_venta) AS ventas
FROM ventanas.ventas_mes
ORDER BY 1;


-- calcular el total acumulado de ventas por usuario usando una window 
SELECT 
	dia_venta,
	nombre_usuario,
	valor_venta,
    SUM(valor_venta) OVER (
    	PARTITION BY nombre_usuario ORDER BY dia_venta
    )  AS ventas
FROM ventanas.ventas_usuarios
ORDER BY 1;