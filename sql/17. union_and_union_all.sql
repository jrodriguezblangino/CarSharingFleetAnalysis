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

