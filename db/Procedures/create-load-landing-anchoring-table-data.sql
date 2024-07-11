CREATE PROCEDURE core.insert_landing_anchoring_table(
     comp_name VARCHAR(255)
    ,comp_type VARCHAR(50)
    ,comp_weight NUMERIC(10,2)
    ,comp_cost NUMERIC(10,2)
    ,la_strength DECIMAL(10,4)
    ,la_material VARCHAR(100)
    ,la_deployment_method VARCHAR(50) 
    ,la_power_consumption DECIMAL(10,4)
    ,la_reliability DECIMAL(5,2)
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

INSERT INTO core.landing_anchoring(
component_id
,strength
,material
,deployment_method
,power_consumption
,reliability
    )
VALUES(
         comp_id
        ,la_strength
        ,la_material
        ,la_deployment_method
        ,la_power_consumption
        ,la_reliability
);

END; $$
