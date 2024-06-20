CREATE TABLE core.attitude_control (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    control_method VARCHAR(100),
    sensor_types VARCHAR(255),
    accuracy DECIMAL(5, 2),
    power_consumption INT,
    operational_lifetime INT,
    redundancy_level VARCHAR(50),
    temperature_tolerance VARCHAR(50),
    radiation_tolerance VARCHAR(50),
    reliability DECIMAL(5, 2)
);
