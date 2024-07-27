-- Thermal_control_systems
SELECT  c.name
      , c.weight
      , c.cost
      , tcs.system_type
      , tcs.temperature_range
      , tcs.power_consumption
      , tcs.operational_lifetime
      , tcs.maintenance_requirements
      , tcs.radiation_resistance
  FROM core.components c 
  JOIN core.thermal_control_systems tcs 
    ON c.id = tcs.component_id
