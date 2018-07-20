SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE i.observations @>'{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"eace7aa2-8444-4c43-b5aa-8b5ec0b19a20"}'
