
/*

     _    ___ _  _____ 
    | |  |_ _| |/ / __|
    | |__ | || ' <| _| 
    |____|___|_|\_\___|

En SQL, la cláusula LIKE se utiliza para buscar un patrón específico dentro de una columna de texto.
busquedas avanzadas (contenido avanzado): https://duckdb.org/docs/sql/functions/regular_expressions.html
*/


-- empiece
SELECT * FROM parranda.usuarios usr
WHERE LOWER(primer_nombre) LIKE 'a%'


-- finalice
SELECT * FROM parranda.usuarios usr
WHERE LOWER(primer_nombre) LIKE '%a'


-- contenga
SELECT * FROM parranda.usuarios usr
WHERE LOWER(primer_nombre) LIKE '%an%'

-- comodin
SELECT * FROM parranda.usuarios usr
WHERE LOWER(primer_nombre) LIKE '_a%'