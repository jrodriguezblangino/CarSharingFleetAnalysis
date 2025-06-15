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
SELECT status, COUNT(*) AS cantidad FROM vehicles GROUP BY status;
