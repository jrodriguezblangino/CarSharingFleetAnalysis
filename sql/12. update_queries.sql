-- ============================================================================
-- 1. Casos básicos de UPDATE
-- ============================================================================

-- a) Actualizar el modelo de un vehículo específico por patente
UPDATE vehicles
SET model = 'Toyota Prius V'
WHERE license_plate = 'ABC123';

-- b) Cambiar la capacidad de una estación
UPDATE stations
SET capacity = 12
WHERE name = 'Estación Norte';


-- ============================================================================
-- 2. UPDATE con condiciones múltiples (AND / OR)
-- ============================================================================

-- a) Marcar todos los vehículos en mantenimiento como 'available' (sólo si ya terminaron el mantenimiento)
UPDATE vehicles
SET status = 'available'
WHERE vehicle_id IN (
    SELECT vehicle_id FROM maintenance
    WHERE end_date IS NOT NULL
);

-- b) Aumentar la capacidad en 2 unidades para todas las estaciones con capacidad menor a 10
UPDATE stations
SET capacity = capacity + 2
WHERE capacity < 10;


-- ============================================================================
-- 3. UPDATE en cascada (varios registros afectados)
-- ============================================================================

-- a) Cambiar el estado a 'maintenance' de todos los vehículos que tengan mantenimientos sin cerrar
UPDATE vehicles
SET status = 'maintenance'
WHERE vehicle_id IN (
    SELECT vehicle_id FROM maintenance
    WHERE end_date IS NULL
);

-- b) Borrar el campo `performed_by` de todos los mantenimientos previos a junio de 2025
UPDATE maintenance
SET performed_by = NULL
WHERE start_date < '2025-06-01';


-- ============================================================================
-- 4. UPDATE de prueba: Crear y revertir cambios
-- ============================================================================

-- a) Marcar un vehículo como 'in_use' (simulación)
UPDATE vehicles
SET status = 'in_use'
WHERE license_plate = 'AA010AA';

-- b) Revertir el cambio para dejarlo como estaba (por ejemplo, 'reserved')
UPDATE vehicles
SET status = 'reserved'
WHERE license_plate = 'AA010AA';
