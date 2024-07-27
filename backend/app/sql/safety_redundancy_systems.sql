SELECT c.name
     , c.weight
     , c.cost
     , srs.system_type
     , srs.functionality
     , srs.reliability
     , srs.redundancy_level
     , srs.power_requirements
     , srs.operational_lifetime
     , srs.maintenance_frequency
  FROM core.components c 
  JOIN core.safety_redundancy_systems srs 
    ON c.id = srs.component_id;
