CREATE PROCEDURE core.insert_attitude_control_table(
     comp_name VARCHAR(255)
    ,comp_type VARCHAR(50)
    ,comp_weight NUMERIC(10,2)
    ,comp_cost NUMERIC(10,2)
    ,atc_control_method VARCHAR(100)
    ,atc_sensor_types VARCHAR(255)
    ,atc_accuracy DECIMAL(5, 2)
    ,atc_power_consumption INT
    ,atc_operational_lifetime INT
    ,atc_redundancy_level VARCHAR(50)
    ,atc_temperature_tolerance VARCHAR(50)
    ,atc_radiation_tolerance VARCHAR(50)
    ,atc_reliability DECIMAL(5, 2)
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

INSERT INTO core.attitude_control(
component_id
,control_method
,sensor_types
,accuracy
,power_consumption
,operational_lifetime
,redundancy_level
,temperature_tolerance
,radiation_tolerance
,reliability
)
VALUES(
         comp_id
        ,atc_control_method
        ,atc_sensor_types
        ,atc_accuracy
        ,atc_power_consumption
        ,atc_operational_lifetime
        ,atc_redundancy_level
        ,atc_temperature_tolerance
        ,atc_radiation_tolerance
        ,atc_reliability
);

END; $$