-- ============================================================================
-- Uso de UNION y UNION ALL
-- ============================================================================


-- ============================================================================
-- 1. UNION vs UNION ALL
-- ============================================================================

-- a) Lista de estados únicos en vehículos y mantenimientos
SELECT status AS estado FROM vehicles
UNION
SELECT 'maintenance' AS estado;

-- b) Lista completa (con posibles duplicados) de tipos de estado
SELECT status AS estado FROM vehicles
UNION ALL
SELECT 'maintenance' AS estado;

-- ============================================================================
-- 2. UNION: Patentes de vehículos en uso o reservados
-- ============================================================================

-- a) Patentes de vehículos reservados
SELECT license_plate FROM vehicles
WHERE status = 'reserved'

UNION

-- b) Patentes de vehículos en uso
SELECT license_plate FROM vehicles
WHERE status = 'in_use';

-- ============================================================================
-- 3. UNION ALL: Análisis de vehículos con mantenimientos registrados
-- ============================================================================

-- a) Vehículos con mantenimiento abierto
SELECT vehicle_id, 'Abierto' AS tipo_mantenimiento FROM maintenance
WHERE end_date IS NULL

UNION ALL

-- b) Vehículos con mantenimiento cerrado
SELECT vehicle_id, 'Cerrado' FROM maintenance
WHERE end_date IS NOT NULL;


-- ============================================================================
-- 5. UNION con alias y ordenamiento global
-- ============================================================================

-- Obtener lista unificada de nombres de estaciones y modelos de vehículos (solo para mostrar)
SELECT name AS nombre, 'Estación' AS tipo FROM stations
UNION
SELECT model, 'Vehículo' FROM vehicles
ORDER BY nombre;
