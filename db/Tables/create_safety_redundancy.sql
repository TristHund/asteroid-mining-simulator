create table core.safety_redundancy_systems (
    id serial primary key,
    component_id INTEGER NOT NULL REFERENCES CORE.COMPONENTS (ID),
    system_type varchar(255),
    functionality text,
    operational_parameters varchar(255),
    reliability decimal(5, 2),
    redundancy_level varchar(100),
    power_requirements integer,
    operational_lifetime integer,
    maintenance_frequency varchar(255)
)