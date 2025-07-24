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