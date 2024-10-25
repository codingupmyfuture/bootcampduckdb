/*

 __   ___   ___ ___   _   ___ _    ___ ___ 
 \ \ / /_\ | _ \_ _| /_\ | _ ) |  | __/ __|
  \ V / _ \|   /| | / _ \| _ \ |__| _|\__ \
   \_/_/ \_\_|_\___/_/ \_\___/____|___|___/
                                           


    referencias: https://duckdb.org/docs/sql/statements/set_variable.html

Una variable es un contenedor que se utiliza para almacenar y representar datos en memoria.
Puedes pensar en una variable como una caja etiquetada en la que puedes poner un valor específico, 
y luego referirte a ese valor usando el nombre de la variable. 
*/



-- NOTA para trabajar con variables, debes tener una versión igual o superior a 1.1

-- verificar versión
SELECT version() version_duckdb

-- ir a la base de datos > editar conexión > configuración de conexión > Driver Settings:
	-- Libraries > desplegar y ver si la versión es 0.10, seleccionar y darle a Download/Update
	-- con eso se actualiza el driver y usa la versión actual


-- NOTA: las variables no son persistentes, se reinician con cada desconexión

-- definir la variable, cambiar por el valor que quieran
SET VARIABLE ruta_archivos = '/Users/lvasq/labs/duckdb';
SET VARIABLE delimitador_os = '/';

-- obtener variables
SELECT getvariable('ruta_archivos') ruta
SELECT getvariable('delimitador_os') ruta


SELECT concat_ws(
	getvariable('delimitador_os'),
	getvariable('ruta_archivos'),
	'prueba', 'texto.txt'
) ruta


-- unset variable
RESET VARIABLE nombre_variable;