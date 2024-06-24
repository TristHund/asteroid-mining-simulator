CREATE TABLE core.sample_return (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    storage_capacity_kg DECIMAL(10, 2),
    sealing_mechanism VARCHAR(255),
    launch_mechanism VARCHAR(255),
    re_entry_capability BOOLEAN,
    power_requirements INTEGER,
    operational_lifetime INTEGER,
    communication_system VARCHAR(255)
);