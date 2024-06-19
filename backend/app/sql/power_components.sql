SELECT c.name
    , c.weight
    , c.cost
    , p.efficiency
    , p.power_output
    , p.temperature_tolerance_min
    , p.temperature_tolerance_max
    , p.degradation_rate
    , p.advantages
    , p,disadvantages
FROM core.components c
JOIN core.power p
  ON c.id = p.component_id