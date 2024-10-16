--TYPE: array
-- referencia: https://duckdb.org/docs/sql/data_types/array

/*
Una lista de elementos que siempre tiene el mismo número de valores del mismo tipo.
*/

--Notas  : insertar [valor1, valor2, valorN]
--  atributo[index] al consultar

-- definir lista
SELECT array_value(7, 8, 9) resultados;


-- obtejer el valor de la lista
SELECT array_value(1, 2, 3)[2] resultados;


-- obtejer el valor de la lista
SELECT array_value(1, 2, 3)[-1] resultados;

-- anidar 
SELECT array_value(
	array_value(1, 2),
	array_value(3, 4), 
	array_value(5, 6)
);

-- pueden almacenar structs
SELECT array_value({'a': 1, 'b': 2}, {'a': 3, 'b': 4}) resultado;