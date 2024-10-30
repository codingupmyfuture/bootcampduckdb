/*

La exportación de datos es un proceso que permite transferir datos desde una base de datos u otro 
sistema de almacenamiento a un formato que pueda ser utilizado por otros programas o aplicaciones. 

FORMATOS:
    PARQUET
    CSV
    JSON
    EXCEL

    References: https://duckdb.org/docs/guides/file_formats/overview

Sintaxis:
    COPY (tabla o DQL) TO 'ruta/archivo.extension' (FORMAT [FORMATO]);
*/

-- exportación csv
COPY parranda.tipo_musica TO '~/Downloads/tipo_musica.csv' (FORMAT CSV);

-- exportación excel
INSTALL spatial;
LOAD spatial;

COPY parranda.tipo_musica TO '~/Downloads/tipo_musica.xlsx' 
WITH (FORMAT GDAL, DRIVER 'xlsx');

-- exportación parquet
COPY parranda.tipo_musica TO '~/Downloads/tipo_musica.parquet' (FORMAT PARQUET);

-- usando DQL
COPY (
SELECT nombre_genero_musica genero
FROM parranda.tipo_musica
) TO '~/Downloads/generos_musicales.csv' (FORMAT CSV);
