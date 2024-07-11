CREATE PROCEDURE core.insert_refinement_table(
     comp_name VARCHAR(255)
    ,comp_type VARCHAR(50)
    ,comp_weight NUMERIC(10,2)
    ,comp_cost NUMERIC(10,2)
    ,refinement_type VARCHAR(255)
    ,processing_capacity NUMERIC(10,2)
    ,efficiency NUMERIC(5,2)
    ,power_consumption INTEGER
    ,operational_lifetime INTEGER
    ,reliability NUMERIC(5,2)
    ,maintenance_requirements VARCHAR(255)
    ,temperature_tolerance VARCHAR(50)
    ,radiation_tolerance VARCHAR(50)
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
    )
    VALUES (
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

    -- Insert into refinement table
    INSERT INTO core.refinement (
        component_id,
        refinement_type,
        processing_capacity,
        efficiency,
        power_consumption,
        operational_lifetime,
        reliability,
        maintenance_requirements,
        temperature_tolerance,
        radiation_tolerance
    )
    VALUES (
        comp_id,
        refinement_type,
        processing_capacity,
        efficiency,
        power_consumption,
        operational_lifetime,
        reliability,
        maintenance_requirements,
        temperature_tolerance,
        radiation_tolerance
    );

END; $$;

