-- ============================================================================
-- Día 2: Inserción de datos de ejemplo para pruebas y consultas
-- ============================================================================

-- Insertar estaciones
INSERT INTO stations (name, address, capacity) VALUES
('Estación Central', 'Av. Principal 123', 10),
('Estación Norte', 'Calle 45 N°567', 8),
('Estación Sur', 'Boulevard 9 de Julio 321', 6);

-- Insertar vehículos
INSERT INTO vehicles (station_id, license_plate, model, status) VALUES
(1, 'ABC123', 'Toyota Prius', 'available'),
(1, 'XYZ789', 'Renault Zoe', 'maintenance'),
(2, 'LMN456', 'Chevrolet Bolt', 'in_use'),
(3, 'DEF321', 'Nissan Leaf', 'reserved');

-- Insertar reservas
INSERT INTO reservations (vehicle_id, user_id, start_time, end_time) VALUES
(1, 101, '2025-06-01 09:00:00', '2025-06-01 12:00:00'),
(3, 102, '2025-06-01 10:00:00', '2025-06-01 14:00:00'),
(4, 103, '2025-06-02 08:30:00', '2025-06-02 11:00:00');

-- Insertar mantenimientos
INSERT INTO maintenance (vehicle_id, start_date, end_date, description, performed_by) VALUES
(2, '2025-06-01', NULL, 'Revisión de batería', 'Taller EcoMotors'),
(1, '2025-05-15', '2025-05-17', 'Cambio de neumáticos', 'Taller Ruedas');

