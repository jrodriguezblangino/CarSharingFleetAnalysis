-- ============================================================================
-- Uso de EXISTS en SQL
-- =============


-- ============================================================================
-- ¿Que hace EXISTS?
-- ============================================================================
-- EXISTS devuelve TRUE si una subconsulta retorna al menos una fila.
-- Se utiliza típicamente con subconsultas correlacionadas.
-- A diferencia de JOIN, no combina datos, sino que comprueba su existencia.

-- Sintaxis básica:
-- SELECT ... FROM tabla1
-- WHERE EXISTS (SELECT 1 FROM tabla2 WHERE condición_relacionada);


-- ============================================================================
-- 1. Básico: Estaciones que tienen al menos un vehículo
-- ============================================================================
SELECT * FROM stations s
WHERE EXISTS (
    SELECT 1 FROM vehicles v
    WHERE v.station_id = s.station_id
);

-- Esto devuelve solo estaciones con al menos un vehículo asignado.


-- ============================================================================
-- 2. Vehiculos que han sido reservados alguna vez
-- ============================================================================
SELECT * FROM vehicles v
WHERE EXISTS (
    SELECT 1 FROM reservations r
    WHERE r.vehicle_id = v.vehicle_id
);
-- Similar a hacer un JOIN, pero más eficiente si solo queremos saber si existe la relación. 
-- USO MAS EFICIENTE DE MEMORIA