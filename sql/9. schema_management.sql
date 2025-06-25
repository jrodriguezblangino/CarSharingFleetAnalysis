 -- ============================================================================
-- Comandos de modificación y mantenimiento del esquema
-- ============================================================================

-- Selección de la base de datos
USE carsharefleet;

-- ===============================
-- REPLACE INTO
-- ===============================
-- REPLACE inserta una nueva fila o actualiza si hay un conflicto en la PRIMARY KEY o UNIQUE

-- Mostramos el contenido actual de la tabla usuarios
SELECT * FROM usuarios;

-- Simulamos un cambio en el email del usuario con id = 1
REPLACE INTO usuarios (id, nombre, email)
VALUES (1, 'Carlos Fernández', 'carlos_nuevo@example.com');

-- Verificamos el cambio
SELECT * FROM usuarios WHERE id = 1;


-- ===============================
-- ALTER TABLE – Agregar y eliminar columnas
-- ===============================

-- Agregamos una columna de tipo 'nivel_cliente' con valor por defecto
ALTER TABLE usuarios ADD COLUMN nivel_cliente VARCHAR(20) DEFAULT 'regular';

-- Verificamos la estructura de la tabla
DESCRIBE usuarios;

-- Luego decidimos eliminarla
ALTER TABLE usuarios DROP COLUMN nivel_cliente;

-- ===============================
-- ALTER TABLE – Modificar tipos de datos y renombrar columnas
-- ===============================

-- Modificar el tipo de dato de la columna 'metodo_pago' en la tabla pagos
ALTER TABLE pagos MODIFY COLUMN metodo_pago VARCHAR(50);

-- Renombraruna columna para mayor claridad
ALTER TABLE estaciones RENAME COLUMN direccion TO ubicacion;

-- Confirmar los cambios
DESCRIBE estaciones;

-- ===============================
-- RENAME TABLE y creación de respaldo
-- ===============================

-- Crear una copia de seguridad de la tabla vehiculos
CREATE TABLE vehiculos_backup AS
SELECT * FROM vehiculos;

-- Verificar que la copia se haya creado
SELECT * FROM vehiculos_backup;

-- Renombar la tabla original como "vehiculos_activos"
RENAME TABLE vehiculos TO vehiculos_activos;

-- Renombrar la copia como "vehiculos"
RENAME TABLE vehiculos_backup TO vehiculos;