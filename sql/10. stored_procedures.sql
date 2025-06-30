-- ============================================================================
-- Stored Procedures en MySQL
-- ============================================================================

-- Seleccionamos la base de datos
USE carsharefleet;

-- IMPORTANTE: delimitadores personalizados para definir procedimientos
DELIMITER //

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