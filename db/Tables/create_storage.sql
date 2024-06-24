CREATE TABLE core.resource_storage (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    storage_type VARCHAR(255),
    capacity_kg DECIMAL(10, 2),
    volume_m3 DECIMAL(10, 2),
    material_type VARCHAR(255),
    sealed BOOLEAN,
    temperature_control BOOLEAN,
    operational_lifetime INTEGER,
    radiation_shielding BOOLEAN,
);