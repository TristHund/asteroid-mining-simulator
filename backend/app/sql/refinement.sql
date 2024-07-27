SELECT c.name
      ,c.weight
      ,c.cost
      ,r.refinement_type
      ,r.processing_capacity
      ,r.efficiency
      ,r.power_consumption
      ,r.operational_lifetime
      ,r.reliability
      ,r.maintenance_requirements
      ,r.temperature_tolerance
  FROM core.components c 
  JOIN core.refinement r 
    ON r.component_id = c.id
