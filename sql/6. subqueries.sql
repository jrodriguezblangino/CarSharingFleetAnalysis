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