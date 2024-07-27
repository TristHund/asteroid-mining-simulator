-- scientific instruments

SELECT  c.name
      , c.weight
      , c.cost 
      , s.instrument_type 
      , s.sensitivity
      , s.resolution
      , s.power_consumption
      , s.operational_lifetime
      , s.data_rate
      , s.field_of_view
      , s.temperature_tolerance_min
      , s.temperature_tolerance_max
  FROM core.components c
  JOIN core.scientific_instruments s
    ON c.id = s.component_id;
