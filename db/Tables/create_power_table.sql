CREATE TABLE CORE.POWER (
	id SERIAL PRIMARY KEY,
	component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
	efficiency NUMERIC(5, 4),
	power_output INTEGER,
	temperature_tolerance_min INTEGER,
	temperature_tolerance_max INTEGER,
	degradation_rate NUMERIC(5, 4),
	advantages VARCHAR,
	disadvantages VARCHAR
)

