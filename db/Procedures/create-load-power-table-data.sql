CREATE PROCEDURE core.insert_power_table_data(
	 comp_name VARCHAR(255)
	,comp_type VARCHAR(50)
	,comp_weight NUMERIC(10,4)
	,comp_cost NUMERIC(10,2)
	,pow_efficiency NUMERIC(5,4)
	,pow_power_output INT
	,pow_temperature_tolerance_min INT
	,pow_temperature_tolerance_max INT
	,pow_degradation_rate NUMERIC(5,4)
	,pow_advantages VARCHAR
	,pow_disadvantages VARCHAR
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

INSERT INTO core.power(
	 component_id
	,efficiency
	,power_output
	,temperature_tolerance_min
	,temperature_tolerance_max
	,degradation_rate
	,advantages
	,disadvantages
	)
VALUES(
	 comp_id
	,pow_efficiency
	,pow_power_output
	,pow_temperature_tolerance_min
	,pow_temperature_tolerance_max
	,pow_degradation_rate
	,pow_advantages
	,pow_disadvantages
	);

END; $$