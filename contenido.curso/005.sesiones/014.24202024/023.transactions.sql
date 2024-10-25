/*

 __   ___   ___ ___   _   ___ _    ___ ___ 
 \ \ / /_\ | _ \_ _| /_\ | _ ) |  | __/ __|
  \ V / _ \|   /| | / _ \| _ \ |__| _|\__ \
   \_/_/ \_\_|_\___/_/ \_\___/____|___|___/
                                           


    referencias: https://duckdb.org/docs/sql/statements/transactions.html
                 https://duckdb.org/2024/09/25/changing-data-with-confidence-and-acid.html

TCL (Transaction Control Language) es un grupo de comandos en bases de datos usado para manejar 
transacciones, asegurando que los cambios se confirmen o se reviertan en caso de error.

Comandos principales:
COMMIT: Guarda cambios definitivamente.
ROLLBACK: Revierte cambios.
*/

/*

CREATE TYPE genero AS ENUM ('hombre', 'mujer', 'otro');

CREATE TABLE IF NOT EXISTS enumeradores.persona(
	nombre_persona VARCHAR NOT NULL,
	genero_persona genero NOT NULL
);

*/

SELECT * FROM enumeradores.persona;

BEGIN TRANSACTION;
-- si sabemos que no van a fallar, usar commit
INSERT INTO enumeradores.persona VALUES ('x', 'otro');
INSERT INTO enumeradores.persona VALUES ('y', 'otro');
COMMIT;


BEGIN TRANSACTION;
-- si sabemos que van a fallar, o es critico usar ROLLBACK, si falla
-- algo, se devuelven los cambios
INSERT INTO enumeradores.persona VALUES ('e', 'otro');
INSERT INTO enumeradores.persona VALUES ('f', 'softserve');
INSERT INTO enumeradores.persona VALUES ('g', 'softserve');
INSERT INTO enumeradores.persona VALUES ('h', 'otro');


ROLLBACK;