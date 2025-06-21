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