/*
  ___ _____   _____ _____ 
 | _ \_ _\ \ / / _ \_   _|
 |  _/| | \ V / (_) || |  
 |_| |___| \_/ \___/ |_|  
                          
    referencias:https://duckdb.org/docs/sql/statements/pivot.html

El PIVOT en SQL se usa para reorganizar y transformar los datos de una tabla, cambiando filas en columnas para facilitar su análisis. 

PIVOT ⟨dataset⟩
    ON ⟨columns⟩
    USING ⟨values⟩
    GROUP BY ⟨rows⟩
    ORDER BY ⟨columns_with_order_directions⟩
    LIMIT ⟨number_of_rows⟩;

*/

-- organizar por dia de venta 
PIVOT (
SELECT 
	dia_venta,
	nombre_usuario,
	valor_venta,
    SUM(valor_venta) OVER (
    	PARTITION BY nombre_usuario ORDER BY dia_venta
    )  AS ventas
FROM ventanas.ventas_usuarios
ORDER BY 1
)
ON dia_venta