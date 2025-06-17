-- ============================================================================
-- Ampliación masiva de datos para prácticas realistas
-- ============================================================================

-- 15 nuevas estaciones
INSERT INTO stations (name, address, capacity) VALUES
('Estación Este', 'Avenida del Este 101', 10),
('Estación Industrial', 'Parque Industrial 456', 15),
('Estación Centro II', 'Diagonal Norte 200', 12),
('Estación Universidad', 'Campus Central 1', 20),
('Estación Suburbana', 'Ruta 3 km 25', 8),
('Estación Hospital', 'Calle Salud 500', 10),
('Estación Shopping', 'Mall Avenue 1234', 14),
('Estación Terminal', 'Terminal de buses s/n', 9),
('Estación Aeropuerto', 'Aeropuerto Internacional', 20),
('Estación Puerto', 'Muelle Principal', 11),
('Estación Rural', 'Camino Rural 80', 6),
('Estación Playa', 'Playa Azul s/n', 7),
('Estación Oficinas', 'Zona Empresarial 18', 13),
('Estación Museo', 'Paseo Histórico 89', 5),
('Estación Eco', 'Zona Verde', 6);

-- 40 vehículos más (status variados)
INSERT INTO vehicles (station_id, license_plate, model, status) VALUES
(7, 'AA001AA', 'Renault Zoe', 'available'),
(8, 'AA002AA', 'Chevrolet Bolt', 'in_use'),
(9, 'AA003AA', 'Peugeot e-208', 'maintenance'),
(10, 'AA004AA', 'Nissan Leaf', 'reserved'),
(11, 'AA005AA', 'Tesla Model Y', 'available'),
(12, 'AA006AA', 'BMW i3', 'in_use'),
(13, 'AA007AA', 'Kia EV6', 'maintenance'),
(14, 'AA008AA', 'Ford Mustang Mach-E', 'available'),
(15, 'AA009AA', 'Hyundai Ioniq 5', 'available'),
(16, 'AA010AA', 'Audi Q4 e-tron', 'reserved'),
(17, 'AA011AA', 'VW ID.4', 'in_use'),
(18, 'AA012AA', 'Mini Electric', 'available'),
(19, 'AA013AA', 'BYD Dolphin', 'available'),
(20, 'AA014AA', 'Fiat 500e', 'maintenance'),
(6, 'AA015AA', 'Volvo EX30', 'reserved'),
(5, 'AA016AA', 'MG4 EV', 'available'),
(4, 'AA017AA', 'Honda e', 'available'),
(3, 'AA018AA', 'Smart EQ Fortwo', 'maintenance'),
(2, 'AA019AA', 'Opel Corsa-e', 'available'),
(1, 'AA020AA', 'Citroën ë-C4', 'reserved'),
(10, 'AA021AA', 'Renault Kangoo ZE', 'in_use'),
(11, 'AA022AA', 'Maxus eDeliver 3', 'available'),
(12, 'AA023AA', 'Peugeot e-Rifter', 'maintenance'),
(13, 'AA024AA', 'Tesla Model S', 'available'),
(14, 'AA025AA', 'BMW i4', 'available'),
(15, 'AA026AA', 'Cupra Born', 'reserved'),
(16, 'AA027AA', 'Skoda Enyaq', 'in_use'),
(17, 'AA028AA', 'Mazda MX-30', 'available'),
(18, 'AA029AA', 'Dacia Spring', 'maintenance'),
(19, 'AA030AA', 'Hyundai Ioniq 6', 'available'),
(20, 'AA031AA', 'Audi e-tron GT', 'reserved'),
(1, 'AA032AA', 'Fiat Panda EV', 'in_use'),
(2, 'AA033AA', 'Renault Twizy', 'available'),
(3, 'AA034AA', 'Tesla Cybertruck', 'reserved'),
(4, 'AA035AA', 'VW ID. Buzz', 'in_use'),
(5, 'AA036AA', 'Mercedes EQB', 'available'),
(6, 'AA037AA', 'Nissan Ariya', 'maintenance'),
(7, 'AA038AA', 'Toyota bZ4X', 'reserved'),
(8, 'AA039AA', 'Honda Prologue', 'in_use'),
(9, 'AA040AA', 'Lucid Air', 'available');

-- 50 reservas (usuarios y fechas variadas)
INSERT INTO reservations (vehicle_id, user_id, start_time, end_time) VALUES
(1, 201, '2025-06-01 08:00:00', '2025-06-01 12:00:00'),
(2, 202, '2025-06-02 09:00:00', '2025-06-02 10:30:00'),
(3, 203, '2025-06-02 14:00:00', '2025-06-02 16:00:00'),
(4, 204, '2025-06-03 08:15:00', '2025-06-03 11:45:00'),
(5, 205, '2025-06-04 10:00:00', '2025-06-04 14:00:00'),
(6, 206, '2025-06-04 13:00:00', '2025-06-04 16:00:00'),
(7, 207, '2025-06-05 09:00:00', '2025-06-05 10:00:00'),
(8, 208, '2025-06-05 10:15:00', '2025-06-05 13:15:00'),
(9, 209, '2025-06-06 08:00:00', '2025-06-06 11:00:00'),
(10, 210, '2025-06-06 09:30:00', '2025-06-06 12:30:00'),
(11, 211, '2025-06-07 07:00:00', '2025-06-07 08:00:00'),
(12, 212, '2025-06-07 09:00:00', '2025-06-07 11:00:00'),
(13, 213, '2025-06-08 10:00:00', '2025-06-08 13:00:00'),
(14, 214, '2025-06-09 08:00:00', '2025-06-09 10:00:00'),
(15, 215, '2025-06-10 11:00:00', '2025-06-10 14:00:00'),
(16, 216, '2025-06-11 12:00:00', '2025-06-11 15:00:00'),
(17, 217, '2025-06-12 09:00:00', '2025-06-12 11:00:00'),
(18, 218, '2025-06-13 07:30:00', '2025-06-13 10:30:00'),
(19, 219, '2025-06-14 10:30:00', '2025-06-14 12:00:00'),
(20, 220, '2025-06-15 09:00:00', '2025-06-15 11:30:00');

-- 20 mantenimientos realistas
INSERT INTO maintenance (vehicle_id, start_date, end_date, description, performed_by) VALUES
(3, '2025-06-01', NULL, 'Cambio de batería', 'Taller Central'),
(7, '2025-05-15', '2025-05-16', 'Revisión frenos', 'Service CarX'),
(14, '2025-06-02', NULL, 'Diagnóstico eléctrico', 'Electro Auto'),
(18, '2025-05-10', '2025-05-11', 'Problema de software', 'Tesla Service'),
(23, '2025-05-20', '2025-05-22', 'Cambio de neumáticos', 'EcoDrive'),
(29, '2025-06-01', NULL, 'Control de suspensión', 'Ruedas Pro'),
(33, '2025-05-25', '2025-05-27', 'Revisión general', 'eMotion Taller'),
(37, '2025-06-03', NULL, 'Fallo en módulo de carga', 'Zev Auto'),
(13, '2025-05-28', NULL, 'Aire acondicionado', 'Taller del Sur'),
(40, '2025-06-01', NULL, 'Chequeo integral', 'ElectroTest');

