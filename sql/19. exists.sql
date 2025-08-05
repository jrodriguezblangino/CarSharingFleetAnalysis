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

-- ============-================================================================
-- 3. Vehículos que nunca han sido reservados (NOT EXISTS)
-- ============================================================================
SELECT * FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1 FROM reservations r
    WHERE r.vehicle_id = v.vehicle_id
);

-- Esta es una forma común de encontrar entidades huerfanas

-- ============================================================================
-- 4. Vehículos con al menos un mantenimiento activo
-- ============================================================================
SELECT * FROM vehicles v
WHERE EXISTS (
    SELECT 1 FROM maintenance m
    WHERE m.vehicle_id = v.vehicle_id
      AND m.end_date IS NULL
);

-- Devuelve vehículos con mantenimiento actual (no finalizado)

-- ============================================================================
-- 5. Usuarios con múltiples reservas (usando EXISTS + subconsulta anidada)
-- ============================================================================
SELECT DISTINCT r1.user_id
FROM reservations r1
WHERE EXISTS (
    SELECT 1 FROM reservations r2
    WHERE r2.user_id = r1.user_id
      AND r2.reservation_id != r1.reservation_id
);


-- Encuentra usuarios que tienen más de una reserva (comprobando si existe otra).