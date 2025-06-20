-- ============================================================================
-- Uso de subconsultas en SELECT, FROM y WHERE
-- ============================================================================

-- ================================
-- Subqueries en SELECT
-- ================================

-- 1. Mostrar cada vehículo y la cantidad total de reservas (subconsulta por fila)
SELECT
  v.license_plate,
  v.model,
  (SELECT COUNT(*) FROM reservations r WHERE r.vehicle_id = v.id) AS total_reservas
FROM vehicles v;

-- 2. Mostrar cada estación y la cantidad de vehículos que tiene
SELECT
  s.name AS estacion,
  (SELECT COUNT(*) FROM vehicles v WHERE v.station_id = s.id) AS total_vehiculos
FROM stations s;

-- ================================
-- Subqueries en WHERE
-- ================================

-- 3. Mostrar vehículos que tienen al menos una reserva
SELECT *
FROM vehicles
WHERE id IN (SELECT DISTINCT vehicle_id FROM reservations);

-- 4. Mostrar estaciones que tienen vehículos actualmente reservados
SELECT *
FROM stations
WHERE id IN (
  SELECT DISTINCT v.station_id
  FROM vehicles v
  JOIN reservations r ON v.id = r.vehicle_id
);

-- 5. Mostrar vehículos que NO tienen reservas (subquery negativa)
SELECT *
FROM vehicles
WHERE id NOT IN (SELECT vehicle_id FROM reservations);

-- ================================
--Subqueries en FROM
-- ================================

-- 6. Obtener el total de reservas por vehículo, y mostrar solo aquellos con más de 2 reservas
SELECT *
FROM (
  SELECT vehicle_id, COUNT(*) AS total_reservas
  FROM reservations
  GROUP BY vehicle_id
) AS sub
WHERE total_reservas > 2;

-- 7. Obtener la duración promedio de las reservas (en minutos) por modelo de vehículo
SELECT model, ROUND(AVG(duracion_min), 1) AS promedio
FROM (
  SELECT v.model,
         TIMESTAMPDIFF(MINUTE, r.start_time, r.end_time) AS duracion_min
  FROM vehicles v
  JOIN reservations r ON v.id = r.vehicle_id
) AS t
GROUP BY model;

-- ================================
-- Subqueries correlacionadas
-- ================================

-- 8. Mostrar todas las reservas que son más largas que el promedio de ese vehículo
SELECT r.*
FROM reservations r
WHERE TIMESTAMPDIFF(MINUTE, r.start_time, r.end_time) >
(
  SELECT AVG(TIMESTAMPDIFF(MINUTE, r2.start_time, r2.end_time))
  FROM reservations r2
  WHERE r2.vehicle_id = r.vehicle_id
);

-- 9. Mostrar vehículos cuya cantidad de reservas supera el promedio general de reservas por vehículo
SELECT v.license_plate
FROM vehicles v
WHERE (
  SELECT COUNT(*)
  FROM reservations r
  WHERE r.vehicle_id = v.id
) > (
  SELECT AVG(cnt)
  FROM (
    SELECT vehicle_id, COUNT(*) AS cnt
    FROM reservations
    GROUP BY vehicle_id
  ) AS sub_avg
);

-- 10. Mostrar las estaciones donde todos los vehículos tienen al menos una reserva
-- (subquery anidada + correlación + lógica de conjuntos)
SELECT s.name
FROM stations s
WHERE NOT EXISTS (
  SELECT 1
  FROM vehicles v
  WHERE v.station_id = s.id
  AND v.id NOT IN (
    SELECT DISTINCT vehicle_id FROM reservations
  )
);