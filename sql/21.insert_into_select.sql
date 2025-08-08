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

-- Copia todos los campos y filas que cumplen la condición

-- ============================================================================
-- 2. Insertar datos seleccionando columnas específicas
-- ============================================================================
-- Crear tabla de modelos populares
CREATE TABLE IF NOT EXISTS popular_models (
    model VARCHAR(50),
    total_reservas INT
);

-- Insertar modelos con más de 3 reservas
INSERT INTO popular_models (model, total_reservas)
SELECT v.model, COUNT(r.reservation_id) AS total_reservas
FROM vehicles v
JOIN reservations r ON v.vehicle_id = r.vehicle_id
GROUP BY v.model
HAVING COUNT(r.reservation_id) > 3;

-- Aquí no copiamos toda la tabla, sino columnas puntuales con agregaciones.
