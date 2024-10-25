/*

  __  __   _   ___ ___  ___  ___ 
 |  \/  | /_\ / __| _ \/ _ \/ __|
 | |\/| |/ _ \ (__|   / (_) \__ \
 |_|  |_/_/ \_\___|_|_\\___/|___/

    referencias: https://duckdb.org/docs/sql/statements/create_macro.html

    Las secuencias son objetos independeientes que generan números únicos en un orden secuencial, 
    comúnmente utilizados para crear identificadores únicos para filas en una tabla.   
*/

-- definir simple macro
CREATE OR REPLACE MACRO sqs.sumar(valor_1, valor_2) AS
valor_1 + valor_2;


-- llamar valores harcodeados
SELECT sqs.sumar(1, 2) resultado

-- usar con atributos dinamicos
SELECT vu.valor_venta,
	sqs.sumar(vu.valor_venta, vu.valor_venta * 0.19) total_produto
FROM ventanas.ventas_usuarios vu


-- problema cotidiano
SELECT dayname('2024-10-04'::DATE) resultado;

SELECT 
    CASE  dayname(today())
        WHEN 'Monday' THEN 'Lunes'
        WHEN 'Tuesday' THEN 'Martes'
        WHEN 'Wednesday' THEN 'Miércoles'
        WHEN 'Thursday' THEN 'Jueves'
        WHEN 'Friday' THEN 'Viernes'
        WHEN 'Saturday' THEN 'Sábado'
        WHEN 'Sunday' THEN 'Domingo'
        ELSE 'desconocido'
    END AS dia_espanol


-- crear macro para traducir
CREATE OR REPLACE MACRO sqs.traducir_dia(fecha) AS
    CASE  dayname(fecha)
        WHEN 'Monday' THEN 'Lunes'
        WHEN 'Tuesday' THEN 'Martes'
        WHEN 'Wednesday' THEN 'Miércoles'
        WHEN 'Thursday' THEN 'Jueves'
        WHEN 'Friday' THEN 'Viernes'
        WHEN 'Saturday' THEN 'Sábado'
        WHEN 'Sunday' THEN 'Domingo'
        ELSE 'desconocido'
    END;

-- validar resultados
SELECT sqs.traducir_dia('2024-10-04'::DATE) fecha_1
SELECT sqs.traducir_dia(today()) fecha_1