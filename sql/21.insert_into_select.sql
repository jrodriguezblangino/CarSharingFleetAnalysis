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

-- ============================================================================
-- 3. Insertar registros derivados de otra tabla con transformación
-- ============================================================================
-- Crear tabla de usuarios frecuentes
CREATE TABLE IF NOT EXISTS frequent_users (
    user_id INT,
    reservas_totales INT
);

-- Insertar usuarios con más de 2 reservas
INSERT INTO frequent_users (user_id, reservas_totales)
SELECT user_id, COUNT(*) AS reservas_totales
FROM reservations
GROUP BY user_id
HAVING COUNT(*) > 2;

-- ============================================================================
-- 4. Insertar datos de múltiples tablas usando JOIN
-- ============================================================================
-- Crear tabla de resumen de mantenimientos por estación
CREATE TABLE IF NOT EXISTS maintenance_summary (
    station_id INT,
    total_mantenimientos INT
);

INSERT INTO maintenance_summary (station_id, total_mantenimientos)
SELECT s.station_id, COUNT(m.maintenance_id) AS total_mantenimientos
FROM stations s
JOIN vehicles v ON s.station_id = v.station_id
JOIN maintenance m ON v.vehicle_id = m.vehicle_id
GROUP BY s.station_id;

-- Demuestra que INSERT INTO SELECT no se limita a una sola tabla, sino que puede
-- usar resultados combinados de varias.

-- ============================================================================
-- 5. Copia de seguridad rápida de reservas recientes
-- ============================================================================
CREATE TABLE IF NOT EXISTS reservations_recent_backup AS
SELECT * FROM reservations WHERE 1=0; -- estructura vacía

INSERT INTO reservations_recent_backup
SELECT * FROM reservations
WHERE start_time >= '2025-06-01';

-- Muy útil para hacer backups selectivos o exportar subconjuntos de datos

