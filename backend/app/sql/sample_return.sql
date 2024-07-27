SELECT  c.name
      , c.weight
      , c.cost 
      , sr.storage_capacity_kg
      , sr.sealing_mechanism
      , sr.launch_mechanism
      , sr.re_entry_capability
      , sr.power_requirements
      , sr.operational_lifetime
      , sr.communication_system
  FROM core.components c 
  JOIN core.sample_return sr 
    ON c.id = sr.component_id
