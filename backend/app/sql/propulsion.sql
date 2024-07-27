SELECT   c.name
       , c.weight
       , c.cost
       , p.thrust
       , p.specific_impulse
       , p.fuel_type
       , p.operational_lifetime
       , p.size
       , p.maintenance_requirements
       , p.reliability
       , p.environmental_impact
       , p.development_status
       , p.fuel_storage_volume
  FROM core.components c
  JOIN core.propulsion p
    ON c.id = p.component_id
