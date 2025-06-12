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
    capacity     INT         NOT NULL,       
    created_at   DATETIME    DEFAULT NOW()
);