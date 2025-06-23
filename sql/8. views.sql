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



-- ===============================
-- Vista de vehículos con tickets pendientes
-- ===============================

CREATE OR REPLACE VIEW vista_vehiculos_con_tickets_pendientes AS
SELECT 
    v.id AS vehiculo_id,
    v.patente,
    t.motivo,
    t.monto,
    t.estado,
    t.fecha
FROM vehiculos v
JOIN tickets t ON v.id = t.vehiculo_id
WHERE t.estado = 'pendiente';

-- Consulta de prueba
SELECT * FROM vista_vehiculos_con_tickets_pendientes;


-- ===============================
-- Vista para análisis financiero por usuario
-- ===============================

CREATE OR REPLACE VIEW vista_gasto_total_por_usuario AS
SELECT 
    u.id AS usuario_id,
    u.nombre,
    u.email,
    SUM(p.monto) AS gasto_total
FROM usuarios u
JOIN pagos p ON u.id = p.usuario_id
GROUP BY u.id, u.nombre, u.email;

-- Consulta de prueba
SELECT * FROM vista_gasto_total_por_usuario ORDER BY gasto_total DESC;


-- ===============================
-- Vistas creadas:
-- - vista_pagos_usuarios
-- - vista_vehiculos_estaciones
-- - vista_vehiculos_con_tickets_pendientes
-- - vista_gasto_total_por_usuario

-- Las vistas permiten encapsular lógicas de consulta reutilizables, 
-- simplificar análisis y preparar bases para dashboards o reports.

