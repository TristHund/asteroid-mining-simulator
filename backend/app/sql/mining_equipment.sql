SELECT c.name
    , c.weight
    , c.cost
    , m.efficiency
    , m.power_consumption
    , m.material
    , m.reliability
    , m.temperature_tolerance_min
    , m.temperature_tolerance_max
FROM core.components c
JOIN core.mining_equipment m
  ON c.id = p.component_id

