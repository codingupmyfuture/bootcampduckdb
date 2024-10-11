-- TYPE: datetimes
-- referencias: https://duckdb.org/docs/sql/functions/timestamp.html
/*

	%a	Nombre local abreviado de día de semana
	%A	Nombre local completo de día de semana
	%b	Nombre local abreviado de mes
	%B	Nombre local completo de mes
	%c	Representación local de fecha y hora
	%d	Día de mes [01,31]
	%H	Hora (horario 24 horas) [00,23]
	%I	Hora (horario 12 horas) [01,12]
	%j	Número de día del año [001,366]
	%m	Mes [01,12]
	%M	Minuto [00,59]
	%S	Segundo
	%U	Nº semana del año. Se considera al Domingo como primer día de semana [00,53]
	%w	Establece el primer día de semana [0(Domingo),1(Lunes)... 6].
	%W	Nº semana del año (Se considera al Lunes como primer día de semana) [00,53]
	%x	Fecha local
	%X	Hora local
	%y	Año en formato corto [00,99]
	%Y	Año en formato largo
	%Z	Nombre de Zona Horaria
 */

-- por defecto, el formato de fechas es %Y-%m-%d, eje: 2024-10-01


-- fechas
SELECT '2024-10-01'::DATE solo_fecha,
 '2024-10-01 15:30:00'::TIMESTAMP fecha_hora,
 '15:30:00'::TIME solo_hora


-- sumar días, años o meses
-- aumentar días | forma #1
SELECT '2024-10-01'::DATE  + 5 fecha_hora

-- aumentar días | forma #1
SELECT '2024-10-01'::DATE + INTERVAL 5 DAY resultado

-- aumentar meses
SELECT '2024-10-01'::DATE + INTERVAL 5 MONTH resultado
-- aumentar años
SELECT '2024-10-01'::DATE + INTERVAL 5 YEAR resultado

-- Nota: con intervar puedes usar más o menos para reducir tiempo
SELECT '2024-10-01'::DATE - INTERVAL 5 YEAR resultado

-- devuelve la fecha actual (al inicio de la transacción actual)
SELECT current_date resultado;

-- convierte una fecha a una cadena según el formato especificado
SELECT strftime('2024-10-01'::DATE, '%d/%m/%Y') resultado;


-- suma el intervalo a la fecha dada
SELECT date_add('2024-10-01'::DATE, INTERVAL 5 DAY) resultado;

-- devuelve el número de límites de partición entre las dos fechas dadas
SELECT date_diff('day', '2024-10-01'::DATE, '2024-10-10'::DATE) resultado;

-- obtiene la subparte de la fecha especificada (equivalente a extract)
SELECT date_part('month', '2024-10-01'::DATE) resultado;

-- trunca la fecha a la precisión especificada
SELECT date_trunc('month', '2024-10-15'::DATE) resultado;


-- alias de date_trunc para truncar la fecha a la precisión especificada
SELECT datetrunc('year', '2024-10-15'::DATE) resultado;

-- devuelve el nombre (en inglés) del día de la semana para la fecha dada
SELECT dayname('2024-10-01'::DATE) resultado;

-- extrae una subparte de la fecha especificada
SELECT extract(month FROM '2024-10-01'::DATE) resultado;

-- devuelve la última de las dos fechas dadas
SELECT greatest('2024-10-01'::DATE, '2024-09-15'::DATE) resultado;

-- devuelve verdadero si la fecha es finita, falso si no lo es
SELECT isfinite('2024-10-01'::DATE) resultado;

-- devuelve verdadero si la fecha es infinita, falso si no lo es
SELECT isinf('2024-10-01'::DATE) resultado;

-- devuelve el último día del mes correspondiente a la fecha dada
SELECT last_day('2024-10-01'::DATE) resultado;

-- devuelve la primera de las dos fechas dadas
SELECT least('2024-10-01'::DATE, '2024-09-15'::DATE) resultado;

-- crea una fecha a partir de las partes dadas
SELECT make_date(2024, 10, 1) resultado;

-- devuelve el nombre (en inglés) del mes para la fecha dada
SELECT monthname('2024-10-01'::DATE) resultado;

-- devuelve la fecha actual (al inicio de la transacción actual)
SELECT today() resultado;
