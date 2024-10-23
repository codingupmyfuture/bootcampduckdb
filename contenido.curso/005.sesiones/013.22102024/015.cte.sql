/*
   ___ _____ ___ 
  / __|_   _| __|
 | (__  | | | _| 
  \___| |_| |___|
                 

Son una forma de definir una consulta temporal y segmentada en SQL.
Los CTEs son útiles para organizar consultas complejas, mejorar la legibilidad del código y evitar la repetición de subconsultas. 

WITH PrimerCTE AS (
    SELECT columna1, columna2
    FROM tabla1
    WHERE condiciones1
),
SegundoCTE AS (
    SELECT columna3, columna4
    FROM tabla2
    WHERE condiciones2
)
-- Consulta principal que utiliza los CTEs
SELECT columna1, columna3
FROM PrimerCTE
JOIN SegundoCTE ON PrimerCTE.columna1 = SegundoCTE.columna3;

*/




WITH musica AS (
	SELECT id_tipo_musica id_musica,
		  UPPER(nombre_genero_musica) musica
	FROM parranda.tipo_musica
	WHERE activo = 'S'
),
parranderos AS (
	SELECT
		usr.id_usuario,
		usr.identificacion ,
	    usr.primer_nombre ,
	    usr.primer_apellido
	FROM parranda.usuarios usr
	INNER JOIN parranda.plato_persona pp 
		ON usr.id_usuario = pp.id_persona
	WHERE pp.confirmado = 'S'
),
usuarios_parranda AS (
	SELECT mp.id_usuario,
	mp.id_tipo_musica id_musica
	FROM parranda.musica_persona mp
)

SELECT  pr.identificacion ,
    pr.primer_nombre ,
    pr.primer_apellido ,
    ms.musica genero_musical
FROM usuarios_parranda up
INNER JOIN parranderos pr ON
	up.id_usuario = pr.id_usuario
INNER JOIN musica ms ON
	ms.id_musica = up.id_musica 
