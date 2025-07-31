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
