CREATE PROCEDURE core.insert_scientific_instruments_table(
    comp_name VARCHAR(255),
    comp_type VARCHAR(50),
    comp_weight NUMERIC(10,2),
    comp_cost NUMERIC(10,2),
    instrument_type VARCHAR(255),
    sensitivity VARCHAR(255),
    resolution VARCHAR(255),
    power_consumption INTEGER,
    operational_lifetime INTEGER,
    data_rate NUMERIC(10,2),
    field_of_view NUMERIC(5,2),
    temperature_tolerance_min INTEGER,
    temperature_tolerance_max INTEGER
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

    -- Insert into scientific_instruments table
    INSERT INTO core.scientific_instruments (
        component_id,
        instrument_type,
        sensitivity,
        resolution,
        power_consumption,
        operational_lifetime,
        data_rate,
        field_of_view,
        temperature_tolerance_min,
        temperature_tolerance_max
    ) VALUES (
        comp_id,
        instrument_type,
        sensitivity,
        resolution,
        power_consumption,
        operational_lifetime,
        data_rate,
        field_of_view,
        temperature_tolerance_min,
        temperature_tolerance_max
    );
END;
$$;

