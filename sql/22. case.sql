-- ============================================================================
-- Uso de CASE en SQL
-- ============================================================================

-- ============================================================================
-- 1. CASE simple: etiquetas según estado del vehículo
-- ============================================================================
SELECT
    vehicle_id,
    license_plate,
    status,
    CASE status
        WHEN 'available' THEN '✅ Disponible'
        WHEN 'reserved' THEN '📅 Reservado'
        WHEN 'in_use' THEN '🚗 En uso'
        WHEN 'maintenance' THEN '🛠 En mantenimiento'
        ELSE '❓ Desconocido'
    END AS estado_amigable
FROM vehicles;


-- CASE simple compara un valor contra una lista de posibles valores.


