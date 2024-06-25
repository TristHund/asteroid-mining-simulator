CREATE TABLE core.communications (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    bandwidth INTEGER,  -- Bandwidth in MHz
    data_rate INTEGER,  -- Data rate in Mbps
    power_consumption INTEGER,  -- Power consumption in Watts
    operational_lifetime INTEGER,  -- Operational lifetime in years
    antenna_type VARCHAR(255),
    eirp DECIMAL(5, 2),  -- Effective Isotropic Radiated Power in dBW
    redundancy_level VARCHAR(255)
);