
/*

  ___  ___ _    ___ _____ ___ 
 |   \| __| |  | __|_   _| __|
 | |) | _|| |__| _|  | | | _| 
 |___/|___|____|___| |_| |___|

	tablas.
	excelente practica, siempre agregar el esquema.objecto

    referencias: https://duckdb.org/docs/sql/statements/delete.html


FROM: Especifica la tabla de la que se seleccionarán o eliminarán los registros.
Ejemplo: FROM empleados indica que la operación se realizará sobre la tabla de empleados.


ORDER JERARQUÍA DELETE

DELETE FROM tabla_principal
JOIN otra_tabla ON tabla_principal.columna_clave = otra_tabla.columna_clave | se verá en DQL
WHERE condicion1
AND condicion2;
*/

SELECT * FROM dml.test_inserts;



-- MALA PRÁCTICA | EL PEOR ERROR DEL MUNDO
DELETE FROM dml.test_inserts;

SELECT * FROM dml.test_inserts;


-- datos de prueba
SELECT * FROM dml.tmp_test_insert_create;


DELETE FROM dml.tmp_test_insert_create
WHERE id_tipo BETWEEN 7 AND 10 AND 
	activo = 'F';

SELECT * FROM dml.tmp_test_insert_create;