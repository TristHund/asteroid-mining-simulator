SELECT c.name
      ,c.weight
      ,c.cost
      ,rs.storage_type
      ,rs.capacity_kg
      ,rs.volume_m3
      ,rs.sealed
      ,rs.temperature_control
      ,rs.operational_lifetime
      ,rs.radiation_shielding
  FROM core.components c 
  JOIN core.resource_storage rs 
    ON c.id = rs.component_id
