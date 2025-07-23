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