-- ========================================================
-- Archivo: consultas.sql
-- Descripción: Consultas SQL progresivas como parte del 
-- proyecto de aprendizaje y práctica de SQL
-- ========================================================

-- =====================
-- Nivel 1: Consultas básicas
-- =====================

-- 1. Obtener todos los vehículos disponibles
SELECT * FROM vehicles WHERE status = 'available';

-- 2. Listar todas las estaciones ordenadas por capacidad (mayor a menor)
SELECT * FROM stations ORDER BY capacity DESC;

-- 3. Mostrar las 10 reservas más recientes
SELECT * FROM reservations ORDER BY start_time DESC LIMIT 10;

-- 4. Ver todos los vehículos en mantenimiento actualmente
SELECT * FROM maintenance WHERE end_date IS NULL;

-- 5. Contar cuántos vehículos hay por estado
SELECT status, COUNT(*) AS cantidad FROM vehicles GROUP BY status;3

-- ===============================
-- Nivel 2: Consultas Intermedias
-- ===============================

-- 6 Cantidad de vehículos hay en cada estación
SELECT s.name AS estacion, COUNT(v.id) AS cantidad_vehiculos
FROM stations s
LEFT JOIN vehicles v ON s.id = v.station_id
GROUP BY s.name;

-- 7. Listar todos los vehículos que hayan tenido alguna reserva
SELECT DISTINCT v.license_plate, v.model
FROM vehicles v
JOIN reservations r ON v.id = r.vehicle_id;

-- 8. Ver reservas que duran más de 2 horas
SELECT *, 
       TIMESTAMPDIFF(MINUTE, start_time, end_time) AS duracion_minutos
FROM reservations
WHERE TIMESTAMPDIFF(MINUTE, start_time, end_time) > 120;

-- 9. Mostrar todos los vehículos que actualmente están en uso o reservados
SELECT * FROM vehicles WHERE status IN ('in_use', 'reserved');

-- 10. Cantidad total de reservas por vehículo
SELECT v.license_plate, COUNT(r.id) AS total_reservas
FROM vehicles v
LEFT JOIN reservations r ON v.id = r.vehicle_id
GROUP BY v.license_plate
ORDER BY total_reservas DESC;
