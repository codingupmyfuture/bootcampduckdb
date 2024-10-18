-- UNION'S - deben tener las mismas columnas

-- para entenderlo, se debe validar por separado
SELECT identificacion, id_genero_persona
FROM parranda.usuarios
WHERE id_genero_persona = 1;


SELECT identificacion, id_genero_persona
FROM parranda.usuarios
WHERE id_genero_persona IN (1,2);

-- UNION ALL: concatena el resultado de ambos queries incluyendon repetidos
SELECT identificacion, id_genero_persona
FROM parranda.usuarios
WHERE id_genero_persona = 1
UNION ALL
SELECT identificacion, id_genero_persona
FROM parranda.usuarios
WHERE id_genero_persona IN (1,2)

-- UNION : concatena el resultado de ambos queries y elimina los repetidos
SELECT identificacion, id_genero_persona
FROM parranda.usuarios
WHERE id_genero_persona = 1
UNION
SELECT identificacion, id_genero_persona
FROM parranda.usuarios
WHERE id_genero_persona IN (1,2)