/*

        _  ___ ___ _  _ ___ 
    _ | |/ _ \_ _| \| / __|
    | || | (_) | || .` \__ \
    \__/ \___/___|_|\_|___/

Los joins son utilizados para combinar filas de dos o más tablas basándose en una relación entre ellas.

inner join combina filas de dos tablas cuando hay una coincidencia en ambas.
left join (también conocido como Left Outer Join)
right join (también conocido como Right Outer Join)
full join (también conocido como Full Outer Join)
cross join
virtual Joins
*/


-- crear el esquema
CREATE SCHEMA IF NOT EXISTS  joins;

-- crear la tabla tipo_genero
CREATE TABLE IF NOT EXISTS joins.tipo_genero (
    id_genero TINYINT PRIMARY KEY,
    genero VARCHAR(50) NOT NULL,
    activo VARCHAR(1) NOT NULL
);

-- crear la tabla usuarios
CREATE TABLE IF NOT EXISTS joins.usuarios (
    id_usuario TINYINT PRIMARY KEY,
    nombre_usuario VARCHAR(50),
    id_genero TINYINT REFERENCES joins.tipo_genero(id_genero),
    activo VARCHAR(1) NOT NULL
);

-- insertar datos en tipo_genero
INSERT INTO joins.tipo_genero VALUES
(1, 'masculino', 'S'),
(2, 'femenino', 'S'),
(3, 'no binario', 'N');

-- insertar datos en usuarios
INSERT INTO joins.usuarios VALUES
(1, 'juan', 1, 'S'),
(2, 'maria', 2, 'S'),
(3, 'carlos', NULL, 'S'),
(4, 'luisa', NULL, 'S'),
(5, 'alex', NULL, 'S');



-- generando error de ambiguedad
SELECT activo --error
FROM joins.usuarios usr
INNER JOIN joins.tipo_genero tg ON 
	usr.id_genero = tg.id_genero;
	
-- JOIN ventajas de la union
SELECT usr.id_usuario, 
	usr.nombre_usuario,
	tg.genero,
	usr.activo
FROM joins.usuarios usr
INNER JOIN joins.tipo_genero tg ON 
	usr.id_genero = tg.id_genero
-- WHERE ..;
	
-- LEFT JOIN	
SELECT *
FROM joins.usuarios usr
LEFT JOIN joins.tipo_genero tg ON 
usr.id_genero = tg.id_genero;

-- RIGHT JOIN
SELECT *
FROM joins.usuarios usr
RIGHT JOIN joins.tipo_genero tg ON 
usr.id_genero = tg.id_genero;


-- FULL JOIN
SELECT *
FROM joins.usuarios usr
FULL JOIN joins.tipo_genero tg 
	ON usr.id_genero = tg.id_genero;

SELECT usr.id_usuario, 
	usr.nombre_usuario,
	ifnull(tg.genero, 'NO-REPORTADO') genero,
	usr.activo
FROM joins.usuarios usr
FULL JOIN joins.tipo_genero tg 
	ON usr.id_genero = tg.id_genero;

-- CROSS JOIN
SELECT *
FROM joins.usuarios usr
CROSS JOIN joins.tipo_genero tg;


-- ejemplo mas de una tabla
SELECT usr.identificacion ,
    usr.primer_nombre ,
    usr.primer_apellido ,
    tm.nombre_genero_musica genero_musical
FROM parranda.musica_persona mp
INNER JOIN parranda.usuarios usr ON
	mp.id_usuario  = usr.id_usuario
JOIN parranda.tipo_musica tm ON
	mp.id_tipo_musica  = tm.id_tipo_musica 
--LIMIT 5;


-- usando group group by
SELECT tm.nombre_genero_musica, COUNT(1) catidad 
FROM parranda.musica_persona mp
INNER JOIN parranda.usuarios usr ON
	mp.id_usuario  = usr.id_usuario
JOIN parranda.tipo_musica tm ON
	mp.id_tipo_musica  = tm.id_tipo_musica 
GROUP BY tm.nombre_genero_musica
HAVING COUNT(*)> 13


-- como usar rango top 3
SELECT tm.nombre_genero_musica, COUNT(1) catidad 
FROM parranda.musica_persona mp
INNER JOIN parranda.usuarios usr ON
	mp.id_usuario  = usr.id_usuario
JOIN parranda.tipo_musica tm ON
	mp.id_tipo_musica  = tm.id_tipo_musica 
-- WHERE 
GROUP BY tm.nombre_genero_musica
ORDER BY 2 DESC
LIMIT 3
