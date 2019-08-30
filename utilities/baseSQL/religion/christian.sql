SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE i.observations @> '{"c922c13c-1fa2-42dd-a7e8-d234b0324870":"48daa405-dcdb-4706-9dbd-a54562012331"}'
[[ and i.registration_date >=(q1 || q4 || quote_literal({{ start_date }}) || q4 || q1  ::DATE)]]
  [[and i.registration_date <=q1 || q4 || quote_literal({{end_date}}) || q4 || q1 ::DATE]]
