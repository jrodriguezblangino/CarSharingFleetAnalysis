-- ============================================================================
-- Proyecto “Car-Sharing Fleet Analysis”
-- Objetivo: Mostrar de forma progresiva y práctica mis conocimientos en MySQL
-- Módulo/Día 1: Definición del esquema de la base de datos
-- ============================================================================

-- 1) Tabla de estaciones
CREATE TABLE stations (
    station_id   INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    address      VARCHAR(255) NOT NULL,
    capacity     INT NOT NULL,       
    created_at   DATETIME DEFAULT NOW()
);

-- 2) Tabla de vehículos
CREATE TABLE vehicles (
    vehicle_id    INT AUTO_INCREMENT PRIMARY KEY,
    station_id    INT          NOT NULL,      -- estación donde está el vehículo
    license_plate VARCHAR(20)  NOT NULL UNIQUE,
    model         VARCHAR(50)  NOT NULL,
    status        ENUM('available','reserved','in_use','maintenance') NOT NULL DEFAULT 'available',
    created_at    DATETIME     DEFAULT NOW(),
    FOREIGN KEY (station_id) REFERENCES stations(station_id)
);

-- 3) Tabla de reservas
CREATE TABLE reservations (
    reservation_id  INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id      INT         NOT NULL,
    user_id         INT         NOT NULL,    
    start_time      DATETIME    NOT NULL,
    end_time        DATETIME    NOT NULL,
    created_at      DATETIME    DEFAULT NOW(),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- 4) Tabla de mantenimientos
CREATE TABLE maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id     INT         NOT NULL,
    start_date     DATE        NOT NULL,
    end_date       DATE        NULL,          -- null si aún está en mantenimiento
    description    TEXT        NULL,
    performed_by   VARCHAR(100) NULL,         
    created_at     DATETIME    DEFAULT NOW(),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
