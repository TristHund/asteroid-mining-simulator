CREATE TABLE core.refinement (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    refinement_type VARCHAR(255),
    processing_capacity DECIMAL(10, 2),
    efficiency DECIMAL(5, 2),
    power_consumption INTEGER,
    operational_lifetime INTEGER,
    reliability DECIMAL(5, 2),
    maintenance_requirements VARCHAR(255),
    temperature_tolerance VARCHAR(50),
    radiation_tolerance VARCHAR(50)
);