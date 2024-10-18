/*
¿Para qué se usan los subqueries en SQL?
Los subqueries son preguntas dentro de otras preguntas en una base de datos. Se utilizan para:

1. Filtrar datos: Encuentran información específica.
2. Calcular valores: Hacen sumas o promedios.
3. Verificar existencia: Comproban si hay datos relacionados.
4. Simplificar consultas: Hacen las preguntas más fáciles de entender.
5. Organizar información: Agrupan datos antes de mostrarlos.

categorías: 
IN
NOT IN
=
EXITSA
*/


-- subqueries

-- IN
-- selecciona todos los usuarios que son de género 'hombre' o 'mujer'
SELECT *
FROM parranda.usuarios 
-- WHERE id_genero_persona IN (1,2)
WHERE id_genero_persona IN (
	SELECT id_genero_persona 
	FROM parranda.tipo_genero_persona 
	WHERE id_genero_persona IN (1, 2)
	-- AND activo = 'S'
);


-- NOT IN
-- selecciona id_genero_persona que no es 'mujer'
SELECT * 
FROM parranda.usuarios 
WHERE id_genero_persona NOT IN (
	SELECT id_genero_persona 
    FROM tipo_genero_persona 
    WHERE id_genero_persona = 2
);

-- IGUAL =
-- selecciona id_genero_persona que es igual a 'otro'
SELECT 
    * 
FROM parranda.usuarios 
WHERE id_genero_persona = (	
	SELECT id_genero_persona 
	FROM parranda.tipo_genero_persona 
	WHERE id_genero_persona = 3
);

-- EXISTS
-- selecciona todos los registros de tipo_genero_persona donde existen usuarios asociados
SELECT * 
FROM parranda.tipo_genero_persona AS tg 
WHERE EXISTS (
	SELECT 1 
    FROM parranda.usuarios AS us 
    WHERE us.id_genero_persona = tg.id_genero_persona
);