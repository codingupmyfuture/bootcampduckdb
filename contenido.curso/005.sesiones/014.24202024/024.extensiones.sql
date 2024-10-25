/*

  _____  _______ ___ _  _ ___ ___ ___  _  _ ___ 
 | __\ \/ /_   _| __| \| / __|_ _/ _ \| \| / __|
 | _| >  <  | | | _|| .` \__ \| | (_) | .` \__ \
 |___/_/\_\ |_| |___|_|\_|___/___\___/|_|\_|___/
                                                
   referencias: https://duckdb.org/docs/extensions/overview.html
        - https://github.com/codingupmyfuture/bootcampduckdb/blob/main/contenido.curso/002.documentos/007.extensiones.pdf
*/

-- toda la info default extensiones
SELECT *
FROM duckdb_extensions();

-- una mejor vista
SELECT extension_name nombre_extension, 
	loaded cargada, 
	installed instalada
FROM duckdb_extensions()
ORDER BY installed DESC, loaded DESC;



-- extensión para leer información del internet

--instala
INSTALL httpfs;

-- carga a la sesión
LOAD httpfs;
