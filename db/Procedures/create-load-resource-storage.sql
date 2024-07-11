CREATE PROCEDURE core.insert_resource_storage_table(
     comp_name VARCHAR(255),
     comp_type VARCHAR(50),
     comp_weight NUMERIC(10,2),
     comp_cost NUMERIC(10,2),
     storage_type VARCHAR(255),
     capacity_kg NUMERIC(10,2),
     volume_m3 NUMERIC(10,2),
     material_type VARCHAR(255),
     sealed BOOLEAN,
     temperature_control BOOLEAN,
     operational_lifetime INTEGER,
     radiation_shielding BOOLEAN
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

    -- Insert into resource_storage table
    INSERT INTO core.resource_storage (
        component_id,
        storage_type,
        capacity_kg,
        volume_m3,
        material_type,
        sealed,
        temperature_control,
        operational_lifetime,
        radiation_shielding
    ) VALUES (
        comp_id,
        storage_type,
        capacity_kg,
        volume_m3,
        material_type,
        sealed,
        temperature_control,
        operational_lifetime,
        radiation_shielding
    );
END;
$$;

