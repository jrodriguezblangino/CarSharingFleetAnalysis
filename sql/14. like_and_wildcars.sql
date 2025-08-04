-- ============================================================================
-- Filtrar datos con patrones usando LIKE, combinando % y _ e integrando condiciones lógicas con AND y OR
-- ============================================================================


-- ============================================================================
-- 1. Uso básico de LIKE con %
-- ============================================================================

-- a) Vehículos cuyo modelo comienza con 'Tesla'
SELECT * FROM vehicles
WHERE model LIKE 'Tesla%';

-- b) Vehículos cuyo modelo termina en 'EV'
SELECT * FROM vehicles
WHERE model LIKE '%EV';

-- c) Vehículos cuyo modelo contiene 'Leaf'
SELECT * FROM vehicles
WHERE model LIKE '%Leaf%';


-- ============================================================================
-- 2. Uso del _
-- ============================================================================

-- a) Patentes que comienzan con 'AA0' y terminan en 'AA', con cualquier dígito entre medio
SELECT * FROM vehicles
WHERE license_plate LIKE 'AA0__AA';

-- b) Modelos con exactamente 4 letras al inicio
SELECT * FROM vehicles
WHERE model LIKE '____%';


-- ============================================================================
-- 3. LIKE con condiciones compuestas (AND, OR, NOT)
-- ============================================================================

-- a) Vehículos cuyo modelo contiene 'BMW' o 'Audi'
SELECT * FROM vehicles
WHERE model LIKE '%BMW%' OR model LIKE '%Audi%';

-- b) Vehículos cuyo modelo contiene 'Nissan' pero NO 'Leaf'
SELECT * FROM vehicles
WHERE model LIKE '%Nissan%' AND model NOT LIKE '%Leaf%';

-- c) Estaciones que contienen 'Centro' o 'Central'
SELECT * FROM stations
WHERE name LIKE '%Centro%' OR name LIKE '%Central%';

-- d) Estaciones cuyo nombre no contiene la palabra 'Estación'
SELECT * FROM stations
WHERE name NOT LIKE '%Estación%';