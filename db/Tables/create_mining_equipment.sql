CREATE TABLE core.mining_equipment (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    efficiency FLOAT NOT NULL,
    power_consumption FLOAT NOT NULL,
    material VARCHAR(100),
    reliability FLOAT NOT NULL,
    temperature_tolerance_min FLOAT NOT NULL,
    temperature_tolerance_max FLOAT NOT NULL,
);