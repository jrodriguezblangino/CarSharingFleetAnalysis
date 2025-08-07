-- ============================================================================
-- Uso de ANY and ALL en SQL
-- ============================================================================

-- ============================================================================
-- ¿Qué hacen ANY y ALL?
-- ============================================================================
-- ANY devuelve TRUE si la condición es verdadera para AL MENOS UN valor del subquery.
-- ALL devuelve TRUE solo si la condición es verdadera para TODOS los valores del subquery.

-- Sintaxis común:
-- SELECT ... FROM tabla
-- WHERE columna operador ANY (subconsulta);
-- SELECT ... FROM tabla
-- WHERE columna operador ALL (subconsulta);

-- ============================================================================
-- 1. ANY
-- ============================================================================

-- a) Vehículos ubicados en estaciones con capacidad mayor a la de alguna estación con capacidad baja (≤ 8)
SELECT * FROM vehicles
WHERE station_id = ANY (
    SELECT station_id FROM stations
    WHERE capacity > ANY (
        SELECT capacity FROM stations WHERE capacity <= 8
    )
);

-- b) Mostrar reservas hechas para cualquiera de los vehículos reservados hoy

SELECT * FROM reservations
WHERE reservation_id = ANY (
    SELECT reservation_id FROM reservations
    WHERE date = CURDATE()
);

-- c)  Mostrar vehículos que tienen mantenimiento registrado en fechas coincidentes con cualquier otro mantenimiento

SELECT * FROM vehicles v
WHERE vehicle_id = ANY (
    SELECT m1.vehicle_id
    FROM maintenance m1
    JOIN maintenance m2 ON m1.vehicle_id = m2.vehicle_id
    WHERE m1.maintenance_id <> m2.maintenance_id
      AND m1.start_date = m2.start_date
);





