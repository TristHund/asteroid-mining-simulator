CREATE PROCEDURE core.insert_safety_redundancy_systems_table(
    comp_name VARCHAR(255),
    comp_type VARCHAR(50),
    comp_weight NUMERIC(10,2),
    comp_cost NUMERIC(10,2),
    system_type VARCHAR(255),
    functionality TEXT,
    operational_parameters VARCHAR(255),
    reliability NUMERIC(5,2),
    redundancy_level VARCHAR(100),
    power_requirements INTEGER,
    operational_lifetime INTEGER,
    maintenance_frequency VARCHAR(255)
)
LANGUAGE plpgsql
AS $$
DECLARE 
    comp_id INT;
BEGIN
    -- Insert into components table
    INSERT INTO core.components (
        name,
        type,
        weight,
        cost
    ) VALUES (
        comp_name,
        comp_type,
        comp_weight,
        comp_cost
    );

    -- Get the newly inserted component id
    SELECT id
    INTO comp_id
    FROM core.components
    ORDER BY created_at DESC
    LIMIT 1;

    -- Insert into safety_redundancy_systems table
    INSERT INTO core.safety_redundancy_systems (
        component_id,
        system_type,
        functionality,
        operational_parameters,
        reliability,
        redundancy_level,
        power_requirements,
        operational_lifetime,
        maintenance_frequency
    ) VALUES (
        comp_id,
        system_type,
        functionality,
        operational_parameters,
        reliability,
        redundancy_level,
        power_requirements,
        operational_lifetime,
        maintenance_frequency
    );
END;
$$;

