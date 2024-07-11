CREATE PROCEDURE core.insert_thermal_control_systems_table(
    comp_name VARCHAR(255),
    comp_type VARCHAR(50),
    comp_weight NUMERIC(10,2),
    comp_cost NUMERIC(10,2),
    system_type VARCHAR(255),
    temperature_range VARCHAR(50),
    power_consumption INTEGER,
    operational_lifetime INTEGER,
    reliability NUMERIC(5,2),
    maintenance_requirements VARCHAR(255),
    radiation_resistance BOOLEAN
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

    -- Insert into thermal_control_systems table
    INSERT INTO core.thermal_control_systems (
        component_id,
        system_type,
        temperature_range,
        power_consumption,
        operational_lifetime,
        reliability,
        maintenance_requirements,
        radiation_resistance
    ) VALUES (
        comp_id,
        system_type,
        temperature_range,
        power_consumption,
        operational_lifetime,
        reliability,
        maintenance_requirements,
        radiation_resistance
    );
END;
$$;

