--TYPE: list
-- referencia: https://duckdb.org/docs/sql/data_types/list
--             https://duckdb.org/docs/sql/expressions/logical_operators.html

/*
Una lista de elementos que puede tener cualquier cantidad de valores del mismo tipo.
*/

--Notas  : insertar [valor1, valor2, valorN]
--  atributo[index] al consultar

-- definir lista
SELECT list_value(7, 8, 9) resultados;


-- obtejer el valor de la lista

-- ejemplo una sola fila
SELECT [1 , 2, NULL, 3] resultado;

-- multiples - se vera mas adelante que es UNION
SELECT [1 , 2, NULL, 3] resultado
UNION
SELECT [5,6] resultado;

-- tipo texto
SELECT ['softserve', 'bootcamp' ] resultado;


-- aninadas
SELECT [[1,2], [3,4], [5,6]] resultado;


-- selecciona el tercer elemento de la lista
SELECT (['a', 'b', 'c'])[3] resultado;

-- selecciona el último elemento de la lista usando un índice negativo
SELECT (['a', 'b', 'c'])[-1] resultado;

-- selecciona el tercer elemento de la lista utilizando una expresión matemática para el índice
SELECT (['a', 'b', 'c'])[2 + 1] resultado;

-- extrae el tercer elemento de la lista usando la función list_extract
SELECT list_extract(['a', 'b', 'c'], 3) resultado;

-- selecciona una porción de la lista desde el primer elemento hasta el segundo
SELECT (['a', 'b', 'c'])[1:2] resultado;

-- selecciona una porción de la lista desde el inicio hasta el segundo elemento
SELECT (['a', 'b', 'c'])[:2] resultado;

-- selecciona una porción de la lista desde el penúltimo elemento hasta el final
SELECT (['a', 'b', 'c'])[-2:] resultado;

-- extrae una porción de la lista desde el segundo elemento hasta el tercero usando la función list_slice
SELECT list_slice(['a', 'b', 'c'], 2, 3) resultado;

-- compara si dos listas son iguales
SELECT [1, 2] = [1, 3] resultado;


-- compara si la primera lista es mayor que la segunda
SELECT [1, 2] > [1, 3] resultado;

-- compara si la primera lista es menor que la segunda
SELECT [1, 2] < [1, 3] resultado;



