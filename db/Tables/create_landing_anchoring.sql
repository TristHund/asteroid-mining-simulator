CREATE TABLE core.landing_anchoring (
    id SERIAL PRIMARY KEY,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    strength FLOAT NOT NULL,
    material VARCHAR(100),
    deployment_method VARCHAR(50),
    power_consumption FLOAT,
    reliability FLOAT
);