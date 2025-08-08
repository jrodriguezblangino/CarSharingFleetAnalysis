-- ============================================================================
-- Uso de INSERT INTO ... SELECT
-- ============================================================================

-- ============================================================================
-- Concepto básico
-- ============================================================================
-- INSERT INTO ... SELECT permite copiar datos desde otra tabla o consulta,
-- en lugar de escribirlos manualmente con VALUES.
-- Muy útil para migraciones, backups parciales o generación de datos derivados.

-- Sintaxis:
-- INSERT INTO tabla_destino (columna1, columna2, ...)
-- SELECT columna1, columna2, ...
-- FROM tabla_origen
-- WHERE condición;


-- ============================================================================
-- 1. Copiar vehículos disponibles a una tabla de prueba
-- ============================================================================
-- Crear tabla temporal para prueba
CREATE TABLE IF NOT EXISTS vehicles_backup AS
SELECT * FROM vehicles WHERE 1=0; -- estructura sin datos

-- Insertar en vehicles_backup todos los vehículos disponibles
INSERT INTO vehicles_backup
SELECT * FROM vehicles
WHERE status = 'available';

-- Copia todos los campos y filas que cumplen la condición.