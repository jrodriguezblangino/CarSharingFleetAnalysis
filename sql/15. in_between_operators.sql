-- ============================================================================
-- 1. IN – Filtrar por múltiples valores específicos
-- ============================================================================

-- a) Vehículos cuyo estado sea 'reserved' o 'in_use'
SELECT * FROM vehicles
WHERE status IN ('reserved', 'in_use');

-- b) Reservas realizadas por usuarios específicos
SELECT * FROM reservations
WHERE user_id IN (101, 103, 220);

-- c) Vehículos asignados a estaciones 1, 2 o 3
SELECT * FROM vehicles
WHERE station_id IN (1, 2, 3);

-- d) Mantenimientos realizados por un conjunto de talleres
SELECT * FROM maintenance
WHERE performed_by IN ('Taller EcoMotors', 'Tesla Service', 'Service CarX');


-- ============================================================================
-- 2. BETWEEN – Filtrar valores dentro de un rango
-- ============================================================================

-- a) Estaciones con capacidad entre 8 y 12
SELECT * FROM stations
WHERE capacity BETWEEN 8 AND 12;

-- b) Reservas que comienzan entre el 5 y el 10 de junio de 2025
SELECT * FROM reservations
WHERE start_time BETWEEN '2025-06-05' AND '2025-06-10';

-- c) Mantenimientos realizados durante mayo de 2025
SELECT * FROM maintenance
WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';

-- d) Vehículos cuyo ID esté entre 5 y 10
SELECT * FROM vehicles
WHERE vehicle_id BETWEEN 5 AND 10;


-- ============================================================================
-- 3. Combinado: IN + BETWEEN
-- ============================================================================

-- a) Reservas de usuarios específicos que ocurren entre el 1 y 7 de junio
SELECT * FROM reservations
WHERE user_id IN (201, 202, 203)
  AND start_time BETWEEN '2025-06-01' AND '2025-06-07';

-- b) Mantenimientos realizados por 'EcoDrive' o 'Taller Central' durante junio
SELECT * FROM maintenance
WHERE performed_by IN ('EcoDrive', 'Taller Central')
  AND start_date BETWEEN '2025-06-01' AND '2025-06-30';
