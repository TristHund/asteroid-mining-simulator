CREATE PROCEDURE core.insert_sample_return_table(
    comp_name VARCHAR(255),
    comp_type VARCHAR(50),
    comp_weight NUMERIC(10,2),
    comp_cost NUMERIC(10,2),
    storage_capacity_kg NUMERIC(10,2),
    sealing_mechanism VARCHAR(255),
    launch_mechanism VARCHAR(255),
    re_entry_capability BOOLEAN,
    power_requirements INTEGER,
    operational_lifetime INTEGER,
    communication_system VARCHAR(255)
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

    -- Insert into sample_return table
    INSERT INTO core.sample_return (
        component_id,
        storage_capacity_kg,
        sealing_mechanism,
        launch_mechanism,
        re_entry_capability,
        power_requirements,
        operational_lifetime,
        communication_system
    ) VALUES (
        comp_id,
        storage_capacity_kg,
        sealing_mechanism,
        launch_mechanism,
        re_entry_capability,
        power_requirements,
        operational_lifetime,
        communication_system
    );
END;
$$;

