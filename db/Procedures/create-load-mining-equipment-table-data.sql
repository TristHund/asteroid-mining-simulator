DROP PROCEDURE core.insert_mining_equipment_table;

CREATE PROCEDURE core.insert_mining_equipment_table(
     comp_name VARCHAR(255)
    ,comp_type VARCHAR(50)
    ,comp_weight NUMERIC(10,2)
    ,comp_cost NUMERIC(10,2)
    ,me_efficiency DECIMAL(10,4)
    ,me_power_consumption DECIMAL(10,2) 
    ,me_material VARCHAR(50) 
    ,me_reliability DECIMAL(5,2)
    ,me_temperature_tolerance_min DECIMAL(5,2)
    ,me_temperature_tolerance_max DECIMAL(5,2)
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

INSERT INTO core.mining_equipment(
component_id
,efficiency
,power_consumption
,material
,reliability
,temperature_tolerance_min
,temperature_tolerance_max
    )
VALUES(
         comp_id
        ,me_efficiency
        ,me_power_consumption
        ,me_material
        ,me_reliability
        ,me_temperature_tolerance_min
        ,me_temperature_tolerance_max 

);

END; $$
