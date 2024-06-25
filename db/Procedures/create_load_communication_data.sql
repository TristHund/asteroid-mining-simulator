CREATE PROCEDURE core.insert_communications_table_data(
	 comp_name VARCHAR(255)
	,comp_type VARCHAR(50)
	,comp_weight NUMERIC(10,4)
	,comp_cost NUMERIC(10,2)
	,coms_bandwidth INTEGER
    ,coms_data_rate INTEGER
    ,coms_power_consumption INTEGER
    ,coms_operational_lifetime INTEGER
    ,coms_antenna_type VARCHAR(255)
    ,coms_eirp DECIMAL(5, 2)
    ,coms_redundancy_level VARCHAR(255)
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

INSERT INTO core.communications(
	 component_id
	 ,bandwidth
     ,data_rate
     ,power_consumption
     ,operational_lifetime
     ,antenna_type
     ,eirp
     ,redundancy_level
    )
VALUES(
	 comp_id
	,coms_bandwidth
    ,coms_data_rate
    ,coms_power_consumption
    ,coms_operational_lifetime
    ,coms_antenna_type
    ,coms_eirp
    ,coms_redundancy_level
    );

END; $$