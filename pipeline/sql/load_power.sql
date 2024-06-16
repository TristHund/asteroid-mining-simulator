DO $$

DECLARE comp_id INT;

BEGIN

INSERT INTO core.components (name, type, weight, cost) 
	VALUES (%s,%s,%s,%s);

SELECT id INTO comp_id FROM core.components;

INSERT INTO core.power 
	(component_id
	, efficiency
	, power_output
	, temperature_tolerance_min
	, temperature_tolerance_max
	, degredation_rate
	, advantages
	, disadvantages)

VALUES (comp_id,%s,%s,%s,%s,%s,%s,%s);

END $$;