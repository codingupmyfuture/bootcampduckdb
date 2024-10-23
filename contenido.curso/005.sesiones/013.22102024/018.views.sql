/*
 __   _____ _____      _____ 
 \ \ / /_ _| __\ \    / / __|
  \ V / | || _| \ \/\/ /\__ \
   \_/ |___|___| \_/\_/ |___/
                             
    referencias: https://duckdb.org/docs/sql/statements/create_view.html

son objetos que representan una consulta almacenada. Funcionan como tablas virtuales, ya que no almacenan datos por sí mismas, 
sino que muestran datos de una o más tablas subyacentes en función de una consulta SQL.

excelente practica, siempre agregar el esquema.objecto

CREATE OR REPLACE VIEW esquema.nombre AS DQL;

*/

-- crear vista con campos heredados (como se llaman los atributos en la entidad)
CREATE OR REPLACE VIEW parranda.v_parranderos AS 
    SELECT usr.identificacion ,
        usr.primer_nombre ,
        usr.primer_apellido ,
        tm.nombre_genero_musica
    FROM parranda.musica_persona mp
    INNER JOIN parranda.usuarios usr ON
        mp.id_usuario  = usr.id_usuario
    JOIN parranda.tipo_musica tm ON
        mp.id_tipo_musica  = tm.id_tipo_musica ;
	

SELECT * FROM parranda.v_parranderos
LIMIT 10;

-- crear vista con campos camuflados (alias) .. practica recomendada
CREATE OR REPLACE VIEW parranda.v_parranderos2 AS 
SELECT usr.identificacion cc,
    usr.primer_nombre  pnombre,
    usr.primer_apellido papellido,
    tm.nombre_genero_musica pmusica
FROM parranda.musica_persona mp
INNER JOIN parranda.usuarios usr ON
	mp.id_usuario  = usr.id_usuario
JOIN parranda.tipo_musica tm ON
	mp.id_tipo_musica  = tm.id_tipo_musica ;
	