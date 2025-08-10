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


-- ============================================================================
-- 2. CASE buscado: clasificar estaciones por capacidad
-- ============================================================================
SELECT
    station_id,
    name,
    capacity,
    CASE
        WHEN capacity >= 15 THEN 'Alta capacidad'
        WHEN capacity BETWEEN 8 AND 14 THEN 'Capacidad media'
        ELSE 'Baja capacidad'
    END AS nivel_capacidad
FROM stations;

-- Permite condiciones más flexibles usando operadores y rangos.


-- ============================================================================
-- 3. CASE con condiciones múltiples y funciones
-- ============================================================================
-- Etiquetar reservas según duración
SELECT
    reservation_id,
    user_id,
    start_time,
    end_time,
    TIMESTAMPDIFF(HOUR, start_time, end_time) AS duracion_horas,
    CASE
        WHEN TIMESTAMPDIFF(HOUR, start_time, end_time) <= 2 THEN 'Corta'
        WHEN TIMESTAMPDIFF(HOUR, start_time, end_time) <= 5 THEN 'Media'
        ELSE 'Larga'
    END AS tipo_reserva
FROM reservations;

-- Podemos combinar funciones y operaciones dentro de CASE para mayor control.