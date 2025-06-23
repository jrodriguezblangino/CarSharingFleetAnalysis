-- ============================================================================
-- Vistas en SQL
-- ============================================================================

-- Usamos la base de datos del proyecto
USE carsharefleet;

-- ===============================
--Vista básica de usuarios con sus pagos
-- ===============================
-- Una vista que muestra el nombre del usuario, email, monto pagado y método

CREATE OR REPLACE VIEW vista_pagos_usuarios AS
SELECT 
    u.id AS usuario_id,
    u.nombre,
    u.email,
    p.monto,
    p.metodo_pago,
    p.fecha_pago
FROM usuarios u
JOIN pagos p ON u.id = p.usuario_id;

-- Consulta de prueba
SELECT * FROM vista_pagos_usuarios;


-- ===============================
-- Vista de vehículos y su estación asignada
-- ===============================

CREATE OR REPLACE VIEW vista_vehiculos_estaciones AS
SELECT 
    v.id AS vehiculo_id,
    v.patente,
    v.marca,
    v.modelo,
    v.tipo,
    e.nombre AS estacion_nombre,
    e.direccion AS estacion_direccion
FROM vehiculos v
LEFT JOIN estaciones e ON v.estacion_id = e.id;

-- Consulta de prueba
SELECT * FROM vista_vehiculos_estaciones;

