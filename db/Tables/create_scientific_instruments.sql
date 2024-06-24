CREATE TABLE core.scientific_instruments (
    instrument_id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    instrument_type VARCHAR(255),
    sensitivity VARCHAR(255),
    resolution VARCHAR(255),
    power_consumption INTEGER,
    operational_lifetime INTEGER,
    data_rate DECIMAL(10, 2),
    field_of_view DECIMAL(5, 2),
    temperature_tolerance_min FLOAT NOT NULL,
    temperature_tolerance_max FLOAT NOT NULL
);