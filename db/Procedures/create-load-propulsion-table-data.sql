DROP PROCEDURE core.insert_propulsion_table;

CREATE PROCEDURE core.insert_propulsion_table(
     comp_name VARCHAR(255)
    ,comp_type VARCHAR(50)
    ,comp_weight NUMERIC(10,2)
    ,comp_cost NUMERIC(10,2)
    ,p_thrust INT
    ,p_specific_impulse INT
    ,p_fuel_type VARCHAR(255)
    ,p_operational_lifetime INT
    ,p_size DECIMAL(10,3)
    ,p_maintenance_requirements VARCHAR(50)
    ,p_reliability VARCHAR(50)
    ,p_environmental_impact VARCHAR(50)
    ,p_development_status VARCHAR(50)
    ,p_fuel_storage_volume DECIMAL(10,4)
)

LANGUAGE plpgsql

AS $$

DECLARE comp_id INT;

BEGIN

INSERT INTO core.components(
     name
    ,type
    ,weight
    ,cost
)
VALUES(
     comp_name
    ,comp_type
    ,comp_weight
    ,comp_cost
);

SELECT id
INTO comp_id
FROM core.components
ORDER BY created_at DESC
LIMIT 1;

INSERT INTO core.propulsion(
     component_id
    ,thrust
    ,specific_impulse
    ,fuel_type
    ,operational_lifetime
    ,size
    ,maintenance_requirements
    ,reliability
    ,environmental_impact
    ,development_status
    ,fuel_storage_volume
    )
VALUES(
         comp_id
        ,p_thrust
        ,p_specific_impulse
        ,p_fuel_type
        ,p_operational_lifetime
        ,p_size
        ,p_maintenance_requirements
        ,p_reliability
        ,p_environmental_impact
        ,p_development_status
        ,p_fuel_storage_volume
);

END; $$
