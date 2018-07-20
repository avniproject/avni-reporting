SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE i.observations @>'{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"36008c2c-7748-426d-9784-ffc5a267db07"}'
