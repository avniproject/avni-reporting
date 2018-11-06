SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE i.observations @>'{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"5c9f10e3-3e20-4a3b-a971-f43b40dd017c"}'
