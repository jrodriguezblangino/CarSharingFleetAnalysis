-- ============================================================================
-- Uso de valores NULL en SQL
-- Objetivo: Practicar detección y manejo de valores NULL en la base de datos
-- ============================================================================

-- ============================================================================
-- 1. NULL en mantenimientos
-- ============================================================================

-- a) Mostrar todos los mantenimientos que aún están en curso (sin fecha de fin)
SELECT * FROM maintenance
WHERE end_date IS NULL;

-- b) Mostrar mantenimientos que ya finalizaron
SELECT * FROM maintenance
WHERE end_date IS NOT NULL;

-- c) Mostrar mantenimientos que no tienen descripción registrada
SELECT * FROM maintenance
WHERE description IS NULL;

-- d) Mostrar mantenimientos que sí tienen descripción registrada
SELECT * FROM maintenance
WHERE description IS NOT NULL;

-- e) Mostrar mantenimientos con campos vacíos en 'performed_by'
SELECT * FROM maintenance
WHERE performed_by IS NULL;

-- ============================================================================
-- 2. NULL en otras tablas
-- ============================================================================

-- a) Simular inserción de mantenimiento sin fecha de finalización
INSERT INTO maintenance (vehicle_id, start_date, end_date, description, performed_by)
VALUES (1, '2025-07-23', NULL, 'Chequeo general', NULL);

-- b) Confirmar que fue insertado correctamente como NULL
SELECT * FROM maintenance
WHERE start_date = '2025-07-23' AND end_date IS NULL;


-- ============================================================================
-- 3. Casos combinados: NULL con otras condiciones
-- ============================================================================

-- a) Mantenimientos en curso realizados por 'Electro Auto'
SELECT * FROM maintenance
WHERE end_date IS NULL AND performed_by = 'Electro Auto';

-- b) Mantenimientos en curso o sin descripción
SELECT * FROM maintenance
WHERE end_date IS NULL OR description IS NULL;

-- c) Mantenimientos que tienen fecha de fin y además descripción registrada
SELECT * FROM maintenance
WHERE end_date IS NOT NULL AND description IS NOT NULL;
