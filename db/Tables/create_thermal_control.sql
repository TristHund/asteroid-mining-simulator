CREATE TABLE core.thermal_control_systems (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    system_type VARCHAR(255),
    temperature_range VARCHAR(50),
    power_consumption INTEGER,
    operational_lifetime INTEGER,
    reliability DECIMAL(5, 2),
    maintenance_requirements VARCHAR(255),
    radiation_resistance BOOLEAN
);