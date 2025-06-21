-- ============================================================================
-- Práctica de Constraints
-- ============================================================================

-- Selección de la base de datos del proyecto
USE carsharefleet;

-- ===============================
-- Constraints básicos
-- ===============================

-- Tabla de usuarios (clientes)
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, email) VALUES 
  ('Carlos Fernández', 'carlos@example.com'),
  ('María Ruiz', 'maria@example.com');

-- ===============================
-- Constraints CHECK y DEFAULT
-- ===============================

-- Tabla de pagos de los clientes
DROP TABLE IF EXISTS pagos;
CREATE TABLE pagos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  monto DECIMAL(10,2) NOT NULL CHECK (monto > 0),
  metodo_pago VARCHAR(20) DEFAULT 'tarjeta',
  fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO pagos (usuario_id, monto, metodo_pago) VALUES
  (1, 500.00, 'tarjeta'),
  (2, 150.00, 'efectivo');

  -- ===============================
-- Restricciones en estaciones y vehículos
-- ===============================

-- Eliminamos si ya existen
DROP TABLE IF EXISTS vehiculos;
DROP TABLE IF EXISTS estaciones;

CREATE TABLE estaciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL UNIQUE,
  direccion VARCHAR(150)
);

CREATE TABLE vehiculos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  patente VARCHAR(20) UNIQUE NOT NULL,
  marca VARCHAR(30),
  modelo VARCHAR(30),
  tipo VARCHAR(20) CHECK (tipo IN ('sedan', 'suv', 'hatchback', 'eléctrico')),
  capacidad INT DEFAULT 4 CHECK (capacidad > 0),
  estacion_id INT,
  FOREIGN KEY (estacion_id) REFERENCES estaciones(id)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

INSERT INTO estaciones (nombre, direccion) VALUES 
  ('Estación Central', 'Av. Siempre Viva 123'),
  ('Punto Norte', 'Calle del Río 456'),
  ('Garaje Sur', 'Boulevard Paz 789');

INSERT INTO vehiculos (patente, marca, modelo, tipo, capacidad, estacion_id) VALUES
  ('XYZ111', 'Toyota', 'Corolla', 'sedan', 5, 1),
  ('ABC222', 'Tesla', 'Model 3', 'eléctrico', 5, 2),
  ('LMN333', 'Renault', 'Kwid', 'hatchback', 4, 3);

-- ===============================
-- Tabla de tickets con múltiples restricciones
-- ===============================

DROP TABLE IF EXISTS tickets;

CREATE TABLE tickets (
  id INT PRIMARY KEY AUTO_INCREMENT,
  vehiculo_id INT NOT NULL,
  motivo VARCHAR(100) NOT NULL,
  monto DECIMAL(10,2) NOT NULL CHECK (monto >= 0),
  estado VARCHAR(20) DEFAULT 'pendiente' CHECK (estado IN ('pendiente', 'pagado', 'cancelado')),
  fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id)
    ON DELETE CASCADE
);

INSERT INTO tickets (vehiculo_id, motivo, monto, estado) VALUES
  (1, 'Daño leve en la carrocería', 200.00, 'pendiente'),
  (2, 'Estacionamiento indebido', 120.00, 'pagado');

-- ===============================
-- ✅ Resumen
-- ===============================
-- En este archivo aplicamos:
-- - PRIMARY KEY y AUTO_INCREMENT
-- - NOT NULL, UNIQUE, DEFAULT
-- - CHECK para validar valores permitidos
-- - FOREIGN KEY con ON DELETE / ON UPDATE