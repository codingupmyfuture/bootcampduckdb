-- USAR DESCRIBE SELECT para validar


-- bigint
SELECT 9223372036854775807 AS num_bigint_positivo,
		-9223372036854775807  num_bigint_negativo;



-- numeric
SELECT 999999999999999.999 AS num_numeric_positivo,
		-999999999999999.999  num_numeric_negativo;


-- float 
SELECT 1.7976931348623157E308 AS num_float_positivo,
		-1.7976931348623157E308  num_float_negativo;


-- integer
SELECT 2147483647 AS num_integer_positivo,
		-2147483647 num_integer_negativo;


-- smallint
SELECT 32767 AS num_smallint_positivo,
		-32767  num_smallint_negativo;

-- tinyint
SELECT 127 AS num_tinyint_positivo,
		-127  num_tinyint_negativo;
	
--hugeint
SELECT 170141183460469231731687303715884105727 AS num_hugeint_positivo,
		-170141183460469231731687303715884105727  num_hugeint_negativo;

	
-- booleanos
SELECT TRUE verdadero,
FALSE falso;
