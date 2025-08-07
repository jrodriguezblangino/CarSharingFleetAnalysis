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



-- ============================================================================
-- 2. ALL 
-- ============================================================================

-- a) Mostrar estaciones cuya capacidad es mayor que la de todas las estaciones con ID menor a 10
SELECT * FROM stations
WHERE capacity > ALL (
    SELECT capacity FROM stations
    WHERE station_id < 10
);

-- Solo devolverá estaciones cuya capacidad supera a todas las estaciones anteriores a ID 10.


-- b) Vehículos en estaciones con menor capacidad que todas las demás
SELECT * FROM vehicles v
WHERE v.station_id = ANY (
    SELECT station_id FROM stations
    WHERE capacity < ALL (
        SELECT capacity FROM stations
    )
);

-- Esto devuelve los vehículos ubicados en la(s) estación(es) de menor capacidad.

-- ============================================================================
-- Comparar duración de reserva con ANY / ALL
-- ============================================================================
-- a) Reservas cuya duración es mayor que cualquiera de las otras
SELECT * FROM reservations r1
WHERE TIMESTAMPDIFF(MINUTE, r1.start_time, r1.end_time) >
      ANY (
          SELECT TIMESTAMPDIFF(MINUTE, r2.start_time, r2.end_time)
          FROM reservations r2
          WHERE r1.reservation_id != r2.reservation_id
      );

-- b) Reservas cuya duración es mayor que TODAS las demás
SELECT * FROM reservations r1
WHERE TIMESTAMPDIFF(MINUTE, r1.start_time, r1.end_time) >
      ALL (
          SELECT TIMESTAMPDIFF(MINUTE, r2.start_time, r2.end_time)
          FROM reservations r2
          WHERE r1.reservation_id != r2.reservation_id
      );


-- Ejemplo para encontrar la reserva más larga (con ALL) o entre las más largas (con ANY).




