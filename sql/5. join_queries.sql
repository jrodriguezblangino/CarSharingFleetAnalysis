-- ============================================================================
-- Práctica de JOINS
-- ============================================================================

-- ===============================
-- INNER JOIN
-- ===============================

-- 1. Obtener las reservas junto con la información del vehículo reservado
SELECT r.id AS reserva_id, r.start_time, r.end_time, v.license_plate, v.model
FROM reservations r
INNER JOIN vehicles v ON r.vehicle_id = v.id;

-- 2. Mostrar los mantenimientos activos y los datos del vehículo asociado
SELECT m.id AS mantenimiento_id, v.license_plate, m.description, m.start_date
FROM maintenance m
INNER JOIN vehicles v ON m.vehicle_id = v.id
WHERE m.end_date IS NULL;

-- 3. Obtener todos los vehículos junto con su estación actual
SELECT v.license_plate, v.model, s.name AS estacion
FROM vehicles v
INNER JOIN stations s ON v.station_id = s.id;

-- ===============================
-- LEFT / RIGHT JOIN
-- ===============================

-- 4. Mostrar todas las estaciones aunque no tengan vehículos asignados
SELECT s.name AS estacion, v.license_plate
FROM stations s
LEFT JOIN vehicles v ON s.id = v.station_id
ORDER BY s.name;

-- 5. Listar todos los vehículos aunque no tengan reservas registradas
SELECT v.license_plate, r.id AS reserva_id, r.start_time
FROM vehicles v
LEFT JOIN reservations r ON v.id = r.vehicle_id
ORDER BY v.license_plate;


-- ===============================
-- FULL OUTER JOIN
-- ===============================

-- 7. Simular un FULL OUTER JOIN entre vehículos y reservas
-- (MySQL no soporta FULL OUTER JOIN directamente)
SELECT v.license_plate, r.id AS reserva_id, r.start_time
FROM vehicles v
LEFT JOIN reservations r ON v.id = r.vehicle_id

UNION

SELECT v.license_plate, r.id AS reserva_id, r.start_time
FROM vehicles v
RIGHT JOIN reservations r ON v.id = r.vehicle_id;

-- ===============================
-- JOIN con Funciones Agregadas
-- ===============================

-- 8. Contar la cantidad de reservas por estación
SELECT s.name AS estacion, COUNT(r.id) AS total_reservas
FROM stations s
JOIN vehicles v ON s.id = v.station_id
LEFT JOIN reservations r ON v.id = r.vehicle_id
GROUP BY s.name
ORDER BY total_reservas DESC;

-- 9. Promedio de duración de reservas por modelo de vehículo
SELECT v.model, ROUND(AVG(TIMESTAMPDIFF(MINUTE, r.start_time, r.end_time)), 1) AS promedio_minutos
FROM vehicles v
JOIN reservations r ON v.id = r.vehicle_id
GROUP BY v.model
ORDER BY promedio_minutos DESC;

