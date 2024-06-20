CREATE TABLE propulsion (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    thrust INT NOT NULL,
    specific_impulse INT NOT NULL,
    fuel_type VARCHAR(255) NOT NULL,
    operational_lifetime INT NOT NULL,
    size NUMERIC(3,1) NOT NULL,
    maintenance_requirements VARCHAR(50) NOT NULL,
    reliability VARCHAR(50) NOT NULL,
    environmental_impact VARCHAR(50) NOT NULL,
    development_status VARCHAR(50) NOT NULL,
    fuel_storage_volume NUMERIC(4,1) NOT NULL
)