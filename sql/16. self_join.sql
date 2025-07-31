-- ============================================================================
-- Práctica progresiva con SELF JOIN
-- ============================================================================


-- ============================================================================
-- 1. Básico: Comparar vehículos por estación
-- ============================================================================
-- Comparar pares de vehículos que están en la misma estación (pero son distintos)

SELECT
    v1.vehicle_id AS vehiculo_1,
    v1.license_plate AS patente_1,
    v2.vehicle_id AS vehiculo_2,
    v2.license_plate AS patente_2,
    s.name AS estacion
FROM vehicles v1
JOIN vehicles v2 ON v1.station_id = v2.station_id AND v1.vehicle_id < v2.vehicle_id
JOIN stations s ON v1.station_id = s.station_id;


-- La condición `v1.vehicle_id < v2.vehicle_id` evita duplicados y autorrelaciones (como v1 = v2).


-- ============================================================================
-- 2. SELF JOIN en reservas: identificar superposición horaria
-- ============================================================================
-- Encontrar reservas hechas por diferentes usuarios para el mismo vehículo en horarios que se cruzan

SELECT
    r1.reservation_id AS reserva_1,
    r1.user_id AS usuario_1,
    r2.reservation_id AS reserva_2,
    r2.user_id AS usuario_2,
    r1.vehicle_id,
    r1.start_time AS inicio_1,
    r1.end_time AS fin_1,
    r2.start_time AS inicio_2,
    r2.end_time AS fin_2
FROM reservations r1
JOIN reservations r2 ON r1.vehicle_id = r2.vehicle_id
    AND r1.reservation_id < r2.reservation_id
    AND r1.start_time < r2.end_time
    AND r2.start_time < r1.end_time;

-- Esto identifica reservas que se solapan en el tiempo para el mismo vehículo.
-- Útil para validar conflictos o bugs en asignación de reservas.


-- ============================================================================
-- 3. SELF JOIN con CASE: comparar vehículos por modelo
-- ============================================================================
-- Mostrar pares de vehículos con el mismo modelo, pero en distintas estaciones

SELECT
    v1.license_plate AS patente_1,
    v1.model,
    v1.station_id AS estacion_1,
    v2.license_plate AS patente_2,
    v2.station_id AS estacion_2
FROM vehicles v1
JOIN vehicles v2 ON v1.model = v2.model
    AND v1.vehicle_id < v2.vehicle_id
    AND v1.station_id != v2.station_id;

-- Se identifican vehículos iguales distribuidos en distintas estaciones.
-- Puede ser útil para auditorías o planificación logística.


-- ============================================================================
-- 4. SELF JOIN en mantenimientos
-- ============================================================================
-- Encontrar vehículos que tienen más de un mantenimiento abierto

SELECT
    m1.vehicle_id,
    v.model,
    m1.maintenance_id AS mantenimiento_1,
    m2.maintenance_id AS mantenimiento_2
FROM maintenance m1
JOIN maintenance m2 ON m1.vehicle_id = m2.vehicle_id
    AND m1.maintenance_id < m2.maintenance_id
    AND m1.end_date IS NULL
    AND m2.end_date IS NULL
JOIN vehicles v ON m1.vehicle_id = v.vehicle_id;

-- Detecta casos anómalos: vehículos con múltiples mantenimientos activos simultáneamente.

