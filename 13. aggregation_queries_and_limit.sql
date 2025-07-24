-- ============================================================================
-- Funciones de agregación + LIMIT y OFFSET
-- ============================================================================


-- ============================================================================
-- 1. COUNT – Contar registros
-- ============================================================================

-- a) Cantidad total de vehículos registrados
SELECT COUNT(*) AS total_vehiculos FROM vehicles;

-- b) Cuántos vehículos están disponibles
SELECT COUNT(*) AS disponibles FROM vehicles
WHERE status = 'available';

-- c) Número de mantenimientos aún en curso
SELECT COUNT(*) AS en_curso FROM maintenance
WHERE end_date IS NULL;


-- ============================================================================
-- 2. MIN y MAX – Valores extremos
-- ============================================================================

-- a) Capacidad mínima de estaciones
SELECT MIN(capacity) AS capacidad_minima FROM stations;

-- b) Capacidad máxima de estaciones
SELECT MAX(capacity) AS capacidad_maxima FROM stations;

-- c) Fecha más antigua de mantenimiento
SELECT MIN(start_date) AS primer_mantenimiento FROM maintenance;

-- d) Última fecha de mantenimiento finalizado
SELECT MAX(end_date) AS ultimo_mantenimiento FROM maintenance
WHERE end_date IS NOT NULL

-- ============================================================================
-- 3. AVG – Promedios
-- ============================================================================

-- a) Promedio de capacidad de las estaciones
SELECT AVG(capacity) AS capacidad_promedio FROM stations;


-- ============================================================================
-- 4. SUM – Suma de valores
-- ============================================================================

-- a) Suma total de la capacidad del sistema (todas las estaciones)
SELECT SUM(capacity) AS capacidad_total FROM stations;


- ============================================================================
-- 5. LIMIT y OFFSET
-- ============================================================================

-- a) Mostrar los primeros 5 vehículos ordenados por modelo (alfabéticamente)
SELECT license_plate, model FROM vehicles
ORDER BY model ASC
LIMIT 5;

-- b) Mostrar 5 vehículos, omitiendo los primeros 5 (paginación)
SELECT license_plate, model FROM vehicles
ORDER BY model ASC
LIMIT 5 OFFSET 5;

-- c) Mostrar las 3 estaciones con mayor capacidad
SELECT name, capacity FROM stations
ORDER BY capacity DESC
LIMIT 3;

-- d) Últimas 5 reservas registradas
SELECT * FROM reservations
ORDER BY created_at DESC
LIMIT 5;


-- ============================================================================
-- 6. Combinado: Agregaciones + LIMIT
-- ============================================================================

-- a) Top 5 estaciones con mayor capacidad y su porcentaje respecto al total
SELECT name, capacity,
    ROUND((capacity / (SELECT SUM(capacity) FROM stations)) * 100, 2) AS porcentaje
FROM stations
ORDER BY capacity DESC
LIMIT 5;