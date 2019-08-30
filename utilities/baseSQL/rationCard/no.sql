SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE i.observations @>'{"476a0b71-485b-4a0a-ba6f-4f3cf13568ca":"e7b50c78-3d90-484d-a224-9887887780dc"}'
[[ and i.registration_date >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
  [[and i.registration_date <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
