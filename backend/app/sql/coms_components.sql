SELECT cp.name
    , cp.weight
    , cp.cost
    , coms.bandwidth
    , coms.data_rate
    , coms.power_consumption
    , coms.operational_lifetime
    , coms.antenna_type
    , coms.eirp
    , coms.redundancy_level
FROM core.components cp
JOIN core.communications coms
  ON cp.id = coms.component_id