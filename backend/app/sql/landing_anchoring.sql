SELECT c.name
    , c.weight
    , c.cost
    , l.strength
    , l.material
    , l.deployment_method
    , l.power_consumption
    , l.reliability
FROM core.components c
JOIN core.landing_anchoring l
  ON c.id = l.component_id

