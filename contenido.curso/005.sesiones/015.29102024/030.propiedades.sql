.prompt "BOOTCAMP"

-- activar tiempo ejecución
.timer on

-- imprimir
.print '\n'
-- listar tablas
.tables


-- ejecutar query modo de salida box
.mode box
SELECT * FROM parranda.tipo_musica;

.print '\n'
-- modo inline
.mode line 
SELECT * FROM parranda.tipo_musica;

.print '\n'

-- mostrar config
.show

.print '\n'


.shell cal
-- Turn the timer off
.timer off
