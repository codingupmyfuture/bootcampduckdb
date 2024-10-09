
/*

  _   _ ___ ___   _ _____ ___ 
 | | | | _ \   \ /_\_   _| __|
 | |_| |  _/ |) / _ \| | | _| 
  \___/|_| |___/_/ \_\_| |___|
                              

	tablas.
	excelente practica, siempre agregar el esquema.objecto

    referencias: https://duckdb.org/docs/sql/statements/update.html

OPERADORES TRANSVERSALES (a excepción de SET)


=: Compara si dos valores son iguales.
Ejemplo: salario = 3000 selecciona empleados cuyo salario es exactamente 3000.

>: Compara si un valor es mayor que otro.
Ejemplo: edad > 30 selecciona empleados mayores de 30 años.

<: Compara si un valor es menor que otro.
Ejemplo: edad < 30 selecciona empleados menores de 30 años.

>=: Compara si un valor es mayor o igual que otro.
Ejemplo: salario >= 4000 selecciona empleados cuyo salario es 4000 o más.

<=: Compara si un valor es menor o igual que otro.
Ejemplo: salario <= 4000 selecciona empleados cuyo salario es 4000 o menos.

!= o <>: Compara si dos valores son diferentes.
Ejemplo: salario != 3000 o salario <> 3000 selecciona empleados cuyo salario no es 3000.

WHERE: Filtra registros según una condición específica.
Ejemplo: WHERE edad > 30 selecciona empleados mayores de 30 años.

IN: Verifica si un valor está dentro de una lista de valores.
Ejemplo: departamento IN ('Ventas', 'Marketing') selecciona empleados que están en los departamentos de Ventas o Marketing.


AND: Combina varias condiciones; todas deben ser verdaderas.
Ejemplo: WHERE edad > 30 AND salario > 3000 selecciona empleados mayores de 30 años y con salario mayor a 3000.

IS: Se usa para comparar con NULL.
Ejemplo: direccion IS NULL selecciona empleados sin dirección registrada.

IS NOT: Verifica si un valor no es NULL.
Ejemplo: direccion IS NOT NULL selecciona empleados que tienen una dirección registrada.

EXISTS: Verifica si una subconsulta devuelve al menos un registro. (se verá en DQL)
Ejemplo: EXISTS (SELECT 1 FROM empleados WHERE salario > 5000) devuelve verdadero si hay al menos un empleado con un salario mayor a 5000.

BETWEEN: Verifica si un valor está dentro de un rango específico.
Ejemplo: salario BETWEEN 3000 AND 5000 selecciona empleados cuyo salario está entre 3000 y 5000, inclusive.

LIKE: Se utiliza para buscar un patrón en una columna de texto.
Ejemplo: nombre LIKE 'A%' selecciona empleados cuyos nombres comienzan con la letra 'A'.


SET: Se usa para actualizar valores en una tabla.
Ejemplo: SET salario = 5000 actualiza el salario de los empleados a 5000.


ORDER JERARQUÍA UPDATE

UPDATE esquema.tabla_principal
SET columna1 = valor1, columna2 = valor2
JOIN otra_tabla ON tabla_principal.columna_clave = otra_tabla.columna_clave | se verá en DQL
WHERE condicion1   | siempre debe tener WHERE | SIEMPRE!!!!!!!!
AND condicion2;

*/


-- eliminar objeto
DROP TABLE dml.tmp_test_insert_create;

-- recrear
CREATE TABLE dml.tmp_test_insert_create AS
 SELECT activo,
	descripcion,
	id_tipo,
	FLOOR(random() * 1000) + 1 salario -- campo aleatorío | DQL
FROM dml.test_inserts;

-- ver estado actual de los datos
SELECT * FROM dml.tmp_test_insert_create;

-- MALA PRÁCTICA | EL PEOR ERROR DEL MUNDO
UPDATE dml.tmp_test_insert_create
SET activo = 'N', salario=0
;




-- simple filtro
UPDATE dml.tmp_test_insert_create
SET activo = 'B'
WHERE salario > 900;

SELECT * FROM dml.tmp_test_insert_create;


-- múltiple filtro

UPDATE dml.tmp_test_insert_create
SET activo = 'C'
WHERE salario <= 90 AND
	  activo = 'S';

SELECT * FROM dml.tmp_test_insert_create;


--  between

UPDATE dml.tmp_test_insert_create
SET activo = 'F'
WHERE id_tipo BETWEEN 7 AND 9;

--  in
UPDATE dml.tmp_test_insert_create
SET activo = 'Z'
WHERE id_tipo IN (4, 6);
	 
SELECT * FROM dml.tmp_test_insert_create;


--  update con operaciones
-- mirar https://www.todamateria.com/jerarquia-de-operaciones/
UPDATE dml.tmp_test_insert_create
SET salario = (salario * 0.3) + salario -- incluso subqueries
WHERE activo != 'N';

SELECT * FROM dml.tmp_test_insert_create;


-- filtros con NULL
SELECT * FROM dml.test_inserts;

UPDATE dml.test_inserts
SET alien = TRUE 
WHERE alien IS NULL;


-- filtros con NOT NULL
SELECT * FROM dml.test_inserts;

UPDATE dml.test_inserts
SET alias = 'NN', activo = 'B'
WHERE alien IS NOT NULL;