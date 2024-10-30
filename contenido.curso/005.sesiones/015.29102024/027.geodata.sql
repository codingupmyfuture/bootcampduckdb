

/*

   ___ ___ ___  ___   _ _____ _   
  / __| __/ _ \|   \ /_\_   _/_\  
 | (_ | _| (_) | |) / _ \| |/ _ \ 
  \___|___\___/|___/_/ \_\_/_/ \_\
                                  
	referencias: https://duckdb.org/docs/extensions/spatial/overview.html
	https://github.com/codingupmyfuture/bootcampduckdb/blob/main/contenido.curso/002.documentos/009.geodata.pdf
*/

-- descargar y activar plugin
INSTALL spatial;
LOAD spatial

-- configurar variable
SET VARIABLE geodata = '/Users/lvasq/labs/duckdb';

-- local
SELECT * 
FROM ST_Read( -- funcion de spatial EXTENSION.
CONCAT_WS('/', getvariable('geodata'), 'comunas_medellin.geojson')
);

-- describamos los datos
DESC SELECT * 
FROM ST_Read( -- funcion de spatial EXTENSION.
CONCAT_WS('/', getvariable('geodata'), 'comunas_medellin.geojson')
);



-- dataset #1
-- centremosnos en los datos relevantes
SELECT
	codigo nro_comuna,
	nombre nombre_comuna,
	geom coordenadas
FROM ST_Read( -- funcion de spatial EXTENSION.
	CONCAT_WS('/', getvariable('geodata'), 'comunas_medellin.geojson')
)
ORDER BY 2;

-- dataset #2
-- crear puntos
SELECT ST_POINT(6.209004649498719, -75.56798270165233) lleras;


-- crear puntos #3
SELECT ST_POINT(6.271055144475173,-75.57311620567457) transito

-- si quisieramos cambiar a otro sistema de coordenadas
SELECT ST_TRANSFORM(
        ST_POINT(6.209004649498719, -75.56798270165233),
        'EPSG:4326', 'EPSG:3857'
);

--
SELECT ST_Distance(
	ST_TRANSFORM(ST_POINT(6.209004649498719, -75.56798270165233),'EPSG:4326', 'EPSG:3857'),
	ST_TRANSFORM(ST_POINT(6.271055144475173, -75.57311620567457),'EPSG:4326', 'EPSG:3857')
) / 1000 distancia 

-- analizar datos, distancia
-- analizar datos, distancia
WITH lleras AS(
	SELECT ST_POINT(
		6.209004649498719, 
		-75.56798270165233
	) coordenadas

),
transito AS (
	SELECT ST_POINT(
		6.271055144475173,
		-75.57311620567457
	) coordenadas
),
comunas as (
	SELECT
		codigo nro_comuna,
		nombre nombre_comuna,
		geom poligono
	FROM ST_Read( -- funcion de spatial EXTENSION.
		CONCAT_WS('/', getvariable('geodata'), 'comunas_medellin.geojson')
	)
)
-- EPSG:3857 utiliza una proyección cilíndrica conforme de cercator. 
--esto significa que las líneas de latitud y longitud son rectas y 
--se cruzan en ángulos rectos.

SELECT 
	ll.coordenadas lleras_punto,
	tt.coordenadas tto_punto,
	st_distance(
		st_transform(ll.coordenadas, 'EPSG:4326', 'EPSG:3857'), 
		st_transform(tt.coordenadas, 'EPSG:4326', 'EPSG:3857')
	)/ 1000 distancia_km_lleras_tto,
	cm.nro_comuna,
	cm.nombre_comuna,
	cm.poligono
FROM lleras ll, 
	 transito tt,
	 comunas cm
WHERE st_within(ll.coordenadas, cm.poligono) OR 
st_within(tt.coordenadas, cm.poligono);


