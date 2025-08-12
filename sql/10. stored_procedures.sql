-- ============================================================================
-- Stored Procedures en MySQL
-- ============================================================================

-- Seleccionamos la base de datos
USE carsharefleet;

-- IMPORTANTE: delimitadores personalizados para definir procedimientos
DELIMITER $$

-- ===============================
-- Stored Procedure básico sin parámetros
-- ===============================
-- Muestra la cantidad total de usuarios registrados

CREATE PROCEDURE contar_usuarios()
BEGIN
    SELECT COUNT(*) AS total_usuarios FROM usuarios;
END;
//

-- Ejecutamos el procedimiento
CALL contar_usuarios();
//

-- ===============================
-- Procedimiento con parámetro de entrada
-- ===============================
-- Muestra todos los vehículos asignados a una estación específica (por ID)

CREATE PROCEDURE vehiculos_por_estacion(IN estacion_id INT)
BEGIN
    SELECT patente, marca, modelo
    FROM vehiculos
    WHERE estacion_id = estacion_id;
END;
//

-- Ejecutamos el procedimiento
CALL vehiculos_por_estacion(2);
//

-- ===============================
-- Procedimiento con lógica condicional
-- ===============================
-- Devuelve un mensaje según el estado del ticket recibido por ID

CREATE PROCEDURE estado_ticket(IN ticket_id INT)
BEGIN
    DECLARE estado_actual VARCHAR(50);

    SELECT estado INTO estado_actual
    FROM tickets
    WHERE id = ticket_id;

    IF estado_actual = 'pendiente' THEN
        SELECT '⚠️ El ticket aún está pendiente' AS mensaje;
    ELSEIF estado_actual = 'pagado' THEN
        SELECT '✅ El ticket ya fue pagado' AS mensaje;
    ELSE
        SELECT '❓ Estado desconocido' AS mensaje;
    END IF;
END;
//

-- Ejecutamos el procedimiento
CALL estado_ticket(1);
//

-- ===============================
-- Procedimiento con múltiples acciones (UPDATE + SELECT)
-- ===============================
-- Marca un ticket como pagado y luego muestra todos los tickets del vehículo

CREATE PROCEDURE pagar_ticket(
    IN ticket_id INT
)
BEGIN
    UPDATE tickets
    SET estado = 'pagado'
    WHERE id = ticket_id;

    SELECT * FROM tickets
    WHERE vehiculo_id = (
        SELECT vehiculo_id FROM tickets WHERE id = ticket_id
    );
END;
//

-- Ejecutamos el procedimiento
CALL pagar_ticket(3);
//



