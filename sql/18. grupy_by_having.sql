-- ============================================================================
-- Uso de GROUP BY y HAVING
-- ============================================================================


-- ============================================================================
-- 1. GROUP BY básico: contar registros por grupo
-- ============================================================================

-- a) Cantidad de vehículos por estación
SELECT station_id, COUNT(*) AS total_vehiculos
FROM vehicles
GROUP BY station_id;

-- b) Cantidad de reservas por usuario
SELECT user_id, COUNT(*) AS total_reservas
FROM reservations
GROUP BY user_id;

-- c) Número de mantenimientos por vehículo
SELECT vehicle_id, COUNT(*) AS total_mantenimientos
FROM maintenance
GROUP BY vehicle_id;


-- ============================================================================
-- 2. GROUP BY con funciones de agregación múltiples
-- ============================================================================

-- a) Mostrar por estación: cantidad de vehículos y modelos distintos
SELECT station_id,
       COUNT(*) AS total_vehiculos,
       COUNT(DISTINCT model) AS modelos_distintos
FROM vehicles
GROUP BY station_id;

-- b) Promedio y duración total de reservas por usuario
SELECT user_id,
       COUNT(*) AS total_reservas,
       AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS duracion_promedio_min,
       SUM(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS duracion_total_min
FROM reservations
GROUP BY user_id;

-- ============================================================================
-- 3. Uso de HAVING: filtrar resultados agregados
-- ============================================================================

-- a) Mostrar usuarios con más de 2 reservas
SELECT user_id, COUNT(*) AS total_reservas
FROM reservations
GROUP BY user_id
HAVING COUNT(*) > 2;

-- b) Mostrar estaciones que tengan más de 5 vehículos
SELECT station_id, COUNT(*) AS total_vehiculos
FROM vehicles
GROUP BY station_id
HAVING total_vehiculos > 5;

-- c) Mostrar vehículos con más de un mantenimiento registrado
SELECT vehicle_id, COUNT(*) AS total_mantenimientos
FROM maintenance
GROUP BY vehicle_id
HAVING COUNT(*) > 1;


-- ============================================================================
-- 4. Combinado: GROUP BY + ORDER BY + HAVING
-- ============================================================================

-- a) Top 5 usuarios con mayor tiempo total de reserva
SELECT user_id,
       COUNT(*) AS reservas,
       SUM(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS tiempo_total_min
FROM reservations
GROUP BY user_id
HAVING reservas >= 1
ORDER BY tiempo_total_min DESC
LIMIT 5;

-- b) Estaciones con al menos 2 modelos distintos de vehículo
SELECT station_id,
       COUNT(DISTINCT model) AS modelos_distintos
FROM vehicles
GROUP BY station_id
HAVING modelos_distintos >= 2;
