/*

  ___ ___ ___  _   _ ___ _  _  ___ ___ ___ 
 / __| __/ _ \| | | | __| \| |/ __| __/ __|
 \__ \ _| (_) | |_| | _|| .` | (__| _|\__ \
 |___/___\__\_\\___/|___|_|\_|\___|___|___/
    referencias: https://duckdb.org/docs/sql/statements/create_sequence.html


  Las secuencias son objetos independeientes que generan números únicos en un orden secuencial, 
  comúnmente utilizados para crear identificadores únicos para filas en una tabla.   
*/


CREATE SCHEMA IF NOT EXISTS sqs;

-- crear secuencia simple
CREATE SEQUENCE IF NOT EXISTS sqs.consecutivo;

-- obtiene el siguiente valor de la secuencia
SELECT nextval('sqs.consecutivo') AS proximo_valor;

-- obtiene el valor actual de la secuencia
SELECT currval('sqs.consecutivo') AS valor_actual;

-- crear secuencia empezando desde un numero especifico
CREATE SEQUENCE IF NOT EXISTS sqs.sq_start START 25;
SELECT nextval('sqs.sq_start') AS proximo_valor;
SELECT currval('sqs.sq_start') AS valor_actual;

-- incremental por un valor definido
CREATE SEQUENCE IF NOT EXISTS sqs.sq_incr
START WITH 1 
INCREMENT BY 5;

SELECT nextval('sqs.sq_incr') AS proximo_valor;
SELECT currval('sqs.sq_incr') AS valor_actual;

-- crear secuencias descendentes
CREATE SEQUENCE sqs.sq_desc 
START WITH 10 
INCREMENT BY -1 
MAXVALUE 10;

SELECT nextval('sqs.sq_desc') AS proximo_valor;
SELECT currval('sqs.sq_desc') AS valor_actual;

-- generar secuencias con limite
CREATE SEQUENCE sqs.seq_limite START WITH 1 MAXVALUE 3;
SELECT nextval('sqs.seq_limite') AS proximo_valor; -- supera 3, genera error
SELECT currval('sqs.seq_limite') AS valor_actual;

-- generar secuencias con limite cicliclas
CREATE SEQUENCE sqs.seq_ciclo START WITH 1 MAXVALUE 3 CYCLE;
SELECT nextval('sqs.seq_ciclo') AS proximo_valor; 
SELECT currval('sqs.seq_ciclo') AS valor_actual;

-- atar la secuencia a un atributo
CREATE TABLE IF NOT EXISTS sqs.ventas (
id_transaccion INTEGER DEFAULT nextval('sqs.consecutivo') PRIMARY KEY,
valor_venta INTEGER
);

INSERT INTO sqs.ventas(valor_venta) VALUES (100), (2342);

SELECT * FROM sqs.ventas;

-- insertar datos
INSERT INTO sqs.ventas VALUES (nextval('sqs.consecutivo'), 100),
                                (nextval('sqs.consecutivo'), 2342);

-- NOTA: mantener la secuencia soltera (no atada a nada)
