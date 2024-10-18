
-- ESQUEMA: parranda
CREATE SCHEMA IF NOT EXISTS parranda;


-- TABLA: parranda.tipo_musica
CREATE TABLE IF NOT EXISTS parranda.tipo_musica (
	id_tipo_musica TINYINT NOT NULL,
	nombre_genero_musica VARCHAR(30) NOT NULL,
	activo VARCHAR(1) NOT NULL CHECK(activo IN ('S', 'N')),
	PRIMARY KEY(id_tipo_musica)
);
COMMENT ON COLUMN parranda.tipo_musica.id_tipo_musica IS 'llave primaria de la tabla';
COMMENT ON COLUMN parranda.tipo_musica.nombre_genero_musica IS 'nombre genero musical';
COMMENT ON COLUMN parranda.tipo_musica.activo IS 'controla si el registro esta activo o inactivo';

INSERT INTO parranda.tipo_musica VALUES 
	(1, 'vallenato', 'S'),
	(2, 'tango', 'S'),
	(3, 'cumbia', 'S'),
	(4, 'reguetón', 'S'),
	(5, 'bambuco', 'S'),
	(6, 'tropical', 'S'),
	(7, 'merengue', 'S'),
	(8, 'pop', 'S'),
	(9, 'salsa', 'S'),
	(10, 'rock', 'S');

-- TABLA: parranda.tipo_genero_persona
CREATE TABLE IF NOT EXISTS parranda.tipo_genero_persona (
	id_genero_persona TINYINT NOT NULL,
	nombre_genero_persona VARCHAR(10) NOT NULL,
	activo VARCHAR(1) NOT NULL CHECK(activo IN ('S', 'N')),
	PRIMARY KEY(id_genero_persona)
);

COMMENT ON COLUMN parranda.tipo_genero_persona.id_genero_persona IS 'llave primaria de la tabla';
COMMENT ON COLUMN parranda.tipo_genero_persona.nombre_genero_persona IS 'nombre genero persona';
COMMENT ON COLUMN parranda.tipo_genero_persona.activo IS 'controla si el registro esta activo o inactivo';

INSERT INTO parranda.tipo_genero_persona VALUES
	(1, 'hombre', 'S'),
	(2, 'mujer', 'S'),
	(3, 'otro', 'S');

-- TABLA: parranda.tipo_dieta
CREATE TABLE IF NOT EXISTS parranda.tipo_dieta (
	id_tipo_dieta TINYINT NOT NULL,
	nombre_dieta VARCHAR(20) NOT NULL,
	activo VARCHAR(1) NOT NULL CHECK(activo IN ('S', 'N')),
	PRIMARY KEY(id_tipo_dieta)
);

COMMENT ON COLUMN parranda.tipo_dieta.id_tipo_dieta IS 'llave primaria de la tabla';
COMMENT ON COLUMN parranda.tipo_dieta.nombre_dieta IS 'nombre dieta persona';
COMMENT ON COLUMN parranda.tipo_dieta.activo IS 'controla si el registro esta activo o inactivo';

INSERT INTO parranda.tipo_dieta VALUES
(1, 'pescetariano', 'S'),
(2, 'vegetariano', 'S'),
(3, 'carnívoro', 'S'),
(4, 'vegano', 'S');

-- TABLA: parranda.tipo_menu
CREATE TABLE IF NOT EXISTS parranda.tipo_menu (
	id_tipo_menu TINYINT NOT NULL,
	nombre_menu VARCHAR(100) NOT NULL,
	id_tipo_dieta TINYINT NOT NULL REFERENCES parranda.tipo_dieta(id_tipo_dieta),
	activo VARCHAR(1) NOT NULL CHECK(activo IN ('S', 'N')),
	PRIMARY KEY(id_tipo_menu)
);

COMMENT ON COLUMN parranda.tipo_menu.id_tipo_menu IS 'llave primaria de la tabla';
COMMENT ON COLUMN parranda.tipo_menu.nombre_menu IS 'nombre del menú';
COMMENT ON COLUMN parranda.tipo_menu.id_tipo_dieta IS 'tipo diega persona, referencia parranda.tipo_dieta.id_tipo_dieta';
COMMENT ON COLUMN parranda.tipo_menu.activo IS 'controla si el registro esta activo o inactivo';

INSERT INTO  parranda.tipo_menu VALUES
	(1, 'cazuela de mariscos', 1, 'S'),
	(2, 'filete de salmón', 1, 'S'),
	(3, 'ceviche de camarón', 1, 'S'),
	(4, 'arepas de choclo con queso', 2, 'S'),
	(5, 'sancocho de guineo', 2, 'S'),
	(6, 'ensalada de aguacate y mango', 2, 'S'),
	(7, 'cerdo apanado en salsas', 3, 'S'),
	(8, 'solomito asado', 3, 'S'),
	(9, 'pollo apanado en salsas', 3, 'S'),
	(10, 'lentejas guisadas', 4, 'S'),
	(11, 'empanadas de yuca', 4, 'S'),
	(12, 'frijoles simples', 4, 'S');

-- TABLA: parranda.usuarios
CREATE TABLE IF NOT EXISTS parranda.usuarios (
	id_usuario INTEGER NOT NULL,
	identificacion VARCHAR(20) NOT NULL UNIQUE,
	primer_nombre VARCHAR(30) NOT NULL,
	segundo_nombre VARCHAR(30),
	primer_apellido VARCHAR(30) NOT NULL,
	segundo_apellido VARCHAR(30),
	telefono VARCHAR(20) NOT NULL,
	id_genero_persona TINYINT NOT NULL REFERENCES parranda.tipo_genero_persona(id_genero_persona),
	activo VARCHAR(1) NOT NULL CHECK(activo IN ('S', 'N')),
	PRIMARY KEY(id_usuario)
);

COMMENT ON COLUMN parranda.usuarios.id_usuario IS 'llave primaria de la tabla';
COMMENT ON COLUMN parranda.usuarios.identificacion IS 'identificación de la persona';
COMMENT ON COLUMN parranda.usuarios.primer_nombre IS 'primer nombre de la persona';
COMMENT ON COLUMN parranda.usuarios.segundo_nombre IS 'segundo nombre de la persona';
COMMENT ON COLUMN parranda.usuarios.primer_apellido IS 'primer apellido de la persona';
COMMENT ON COLUMN parranda.usuarios.segundo_apellido IS 'segundo apellido de la persona';
COMMENT ON COLUMN parranda.usuarios.telefono IS 'telefono de la persona';
COMMENT ON COLUMN parranda.usuarios.id_genero_persona IS 'tipo genero persona, referencia parranda.tipo_genero_persona.id_genero_persona';
COMMENT ON COLUMN parranda.usuarios.activo IS 'controla si el registro esta activo o inactivo';


INSERT INTO parranda.usuarios (
	id_usuario,
	primer_nombre,
	segundo_nombre,
	primer_apellido,
	segundo_apellido,
	telefono,
	identificacion,
	id_genero_persona,
	activo
) VALUES
	(1, 'Juan', NULL, 'Espinosa', 'González', '6046390826', '1095672677', 1, 'S'),
	(2, 'José', 'Luis', 'Martínez', NULL, '3179054864', '1052988648', 2, 'S'),
	(3, 'Orlando', 'Ignacio', 'Arévalo', 'Pinzón', '3110601680', '32057626', 3, 'S'),
	(4, 'Andrés', 'Carlos', 'Cuéllar', 'Lara', '3183275188', '5173540', 1, 'S'),
	(5, 'Fabio', NULL, 'Gómez', NULL, '3163866597', '1277218634', 2, 'S'),
	(6, 'Paulina', 'Karen', 'Pineda', NULL, '3246891544', '2238096', 1, 'S'),
	(7, 'Milena', 'María', 'Granados', NULL, '3063261820', '1112962067', 3, 'S'),
	(8, 'Nelly', 'Yolanda', 'Zapata', 'Sandoval', '6028985122', '37048740', 2, 'S'),
	(9, 'Josué', NULL, 'Muñoz', NULL, '3144504714', '1270174527', 1, 'S'),
	(10, 'Eder', 'Vicente', 'Luna', NULL, '3164281821', '32221768', 3, 'S'),
	(11, 'Ángela', NULL, 'García', 'Gómez', '6017673905', '1156133390', 2, 'S'),
	--(12, 'Ángela', NULL, 'García', 'Gómez', '6017673905', '1156133390', 2, 'S'),
	(13, 'Santiago', NULL, 'Sánchez', 'Arango', '3116147501', '64138677', 3, 'S'),
	(14, 'Óscar', NULL, 'Vega', NULL, '6042411683', '5672674', 2, 'S'),
	(15, 'Samuel', 'Omar', 'Benavides', NULL, '3201227286', '10653477', 2, 'S'),
	(16, 'Fernanda', NULL, 'Hernández', NULL, '3036494636', '1070806010', 2, 'S'),
	(17, 'Adriana', NULL, 'Agudelo', NULL, '6046276898', '1061672134', 2, 'S'),
	(18, 'Liliana', 'Leonor', 'Pineda', 'Hernández', '3214728518', '2697221', 1, 'S'),
	(19, 'Edinson', NULL, 'Ramírez', NULL, '3081265978', '6810745', 1, 'S'),
	(20, 'Armando', 'Antonio', 'Hurtado', 'Hernández', '18006581340', '91431183', 2, 'S'),
	(21, 'Milena', NULL, 'Ojeda', NULL, '3059806659', '5546198', 2, 'S'),
	(22, 'Fernando', 'Alberto', 'Sanabria', NULL, '6027232626', '1203617628', 1, 'S'),
	(23, 'Kevin', 'Javier', 'Andrade', NULL, '3211392954', '1238804985', 2, 'S'),
	(24, 'Liliana', 'Jimena', 'Gutiérrez', 'Zambrano', '3014060093', '1181158956', 3, 'S'),
	(25, 'Juan', NULL, 'Vargas', 'Betancur', '3033370751', '32267050', 2, 'S'),
	(26, 'Estela', 'Amparo', 'Rivera', 'Vega', '31011463', '1197118561', 3, 'S'),
	(27, 'Yolanda', 'Rocío', 'Palacios', NULL, '3182835486', '3536178', 3, 'S'),
	(28, 'Gildardo', 'Víctor', 'Ramírez', NULL, '3203374668', '78657032', 3, 'S'),
	(29, 'Sofía', 'Dora', 'Méndez', 'Gaviria', '3229713', '1127221678', 2, 'S'),
	(30, 'Edgar', NULL, 'González', NULL, '3158896043', '1286547868', 1, 'S'),
	(31, 'Jhon', 'Alexander', 'Durán', 'García', '60872318', '7700492', 1, 'S');


-- TABLA: parranda.musica_persona
CREATE TABLE IF NOT EXISTS parranda.musica_persona (
	id_usuario INTEGER NOT NULL REFERENCES parranda.usuarios(id_usuario),
	id_tipo_musica TINYINT NOT NULL REFERENCES parranda.tipo_musica(id_tipo_musica),
	PRIMARY KEY(id_usuario, id_tipo_musica)
);

COMMENT ON COLUMN parranda.musica_persona.id_usuario IS 'usuario para identificar preferencia';
COMMENT ON COLUMN parranda.musica_persona.id_tipo_musica IS 'tipo musica de prerefencia del usuario';

INSERT INTO parranda.musica_persona VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 1),
(3, 9),
(3, 2),
(3, 4),
(4, 1),
(4, 3),
(6, 5),
(6, 7),
(6, 4),
(7, 9),
(7, 2),
(7, 6),
(7, 8),
(7, 7),
(7, 3),
(7, 4),
(8, 10),
(8, 3),
(8, 9),
(9, 7),
(9, 8),
(9, 6),
(9, 9),
(9, 2),
(9, 10),
(10, 4),
(10, 5),
(10, 3),
(11, 4),
(11, 7),
(11, 3),
(11, 10),
(11, 5),
(11, 6),
(11, 2),
(11, 8),
(11, 9),
(14, 9),
(14, 10),
(14, 3),
(14, 5),
(14, 8),
(14, 2),
(14, 1),
(14, 6),
(15, 9),
(15, 4),
(15, 3),
(15, 7),
(15, 6),
(16, 1),
(16, 2),
(16, 5),
(16, 8),
(17, 8),
(17, 4),
(17, 10),
(17, 2),
(18, 3),
(18, 6),
(18, 8),
(18, 1),
(18, 5),
(18, 10),
(18, 9),
(18, 7),
(19, 2),
(19, 3),
(19, 4),
(19, 6),
(20, 4),
(20, 2),
(20, 7),
(20, 8),
(20, 1),
(20, 5),
(20, 6),
(21, 6),
(21, 5),
(21, 7),
(21, 3),
(21, 10),
(23, 4),
(23, 9),
(23, 1),
(23, 2),
(23, 3),
(23, 8),
(23, 6),
(23, 5),
(23, 7),
(24, 7),
(24, 1),
(24, 6),
(24, 8),
(24, 9),
(24, 4),
(24, 5),
(25, 3),
(25, 8),
(25, 2),
(25, 5),
(25, 4),
(25, 6),
(25, 9),
(26, 6),
(26, 4),
(26, 7),
(26, 1),
(27, 4),
(27, 3),
(27, 9),
(27, 2),
(27, 7),
(27, 6),
(28, 1),
(28, 8),
(28, 10),
(28, 2),
(28, 7),
(28, 3),
(28, 5),
(28, 4),
(28, 6),
(28, 9),
(29, 10),
(29, 6),
(29, 7),
(29, 1),
(29, 2),
(29, 4),
(29, 3),
(29, 5),
(30, 4),
(30, 10),
(30, 6),
(30, 8),
(30, 1),
(30, 9),
(30, 2),
(31, 8),
(31, 1),
(31, 3),
(31, 5);


-- TABLA: plato_persona
CREATE TABLE IF NOT EXISTS parranda.plato_persona (
	id_persona INTEGER NOT NULL,
	id_tipo_menu TINYINT NOT NULL,
	confirmado VARCHAR(1) NOT NULL CHECK(confirmado IN ('S', 'N')),
	PRIMARY KEY(id_persona)
);

COMMENT ON COLUMN parranda.plato_persona.id_persona IS 'usuario para identificar preferencia';
COMMENT ON COLUMN parranda.plato_persona.id_tipo_menu IS 'tipo de plato que comera la persona';
COMMENT ON COLUMN parranda.plato_persona.confirmado IS 'controla si el usuario confirmo o no asistencia';


INSERT INTO parranda.plato_persona VALUES 
(1, 1, 'N'),
(2, 4, 'N'),
(3, 2, 'S'),
(4, 6, 'N'),
(5, 7, 'N'),
(6, 10, 'N'),
(7, 6, 'S'),
(8, 1, 'S'),
(9, 10, 'N'),
(10, 2, 'N'),
(11, 8, 'N'),
(13, 2, 'S'),
(14, 8, 'S'),
(15, 7, 'S'),
(16, 2, 'S'),
(17, 3, 'N'),
(18, 8, 'S'),
(19, 5, 'N'),
(20, 10, 'N'),
(21, 1, 'N'),
(22, 8, 'S'),
(23, 9, 'S'),
(24, 11, 'S'),
(25, 3, 'S'),
(26, 3, 'S'),
(27, 5, 'N'),
(28, 12, 'S'),
(29, 1, 'S'),
(30, 1, 'S'),
(31, 7, 'S');