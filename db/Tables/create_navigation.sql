CREATE TABLE core.navigation (
    system_id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    navigation_type VARCHAR(255),
    accuracy DECIMAL(10, 2),
    power_consumption INTEGER,
    operational_lifetime INTEGER,
    redundancy_level VARCHAR(100),
    temperature_tolerance INT,
    radiation_tolerance DECIMAL (5,4)
    );