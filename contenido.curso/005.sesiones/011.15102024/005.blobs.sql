--TYPE: texto
-- referencia: https://duckdb.org/docs/sql/functions/blob.html

/*
Un BLOB (Binary Large Object) es un tipo de dato que se usa para almacenar 
archivos grandes o datos en una base de datos, como imágenes, videos, 
documentos, y otros tipos de archivos. En lugar de guardar el archivo en el disco de la computadora, 
se guarda directamente en la base de datos para que esté todo en un solo lugar y se pueda acceder a él fácilmente.

*/

SELECT '\xAA\xAB\xAC'::BLOB resultado;