SELECT c.name
    , c.weight
    , c.cost
    , a.control_method
    , a.sensor_types
    , a.accuracy
    , a.power_consumption
    , a.operational_lifetime
    , a.redundancy_level
    , a.temperature_tolerance
    , a.radiation_tolerance
    , a.reliability
FROM core.components c
JOIN core.attitude_control a
  ON c.id = a.component_id