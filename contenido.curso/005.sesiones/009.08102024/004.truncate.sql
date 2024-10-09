
/*

  _____ ___ _   _ _  _  ___   _ _____ ___ 
 |_   _| _ \ | | | \| |/ __| /_\_   _| __|
   | | |   / |_| | .` | (__ / _ \| | | _| 
   |_| |_|_\\___/|_|\_|\___/_/ \_\_| |___|


	tablas.
	excelente practica, siempre agregar el esquema.objecto

    referencias: https://duckdb.org/docs/sql/statements/delete.html

TRUNCATE: Elimina todas las filas de una tabla de manera rápida y no registra la eliminación de cada fila, 
        por lo que no se puede usar una cláusula WHERE. No puede ser revertido si se ejecuta en una transacción.

    registra la eliminación de cada fila: cuando se eliminan, datos se pueden recuperar en bases de datos como oracle,
    pero truncate elimina esa posibilidad.

DELETE: Elimina filas específicas según una condición definida en la cláusula WHERE. Cada eliminación se registra, 
        por lo que se puede revertir en una transacción.


*/

TRUNCATE dml.tmp_test_insert_create;

