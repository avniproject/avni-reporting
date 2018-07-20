SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE i.observations @> '{"61ab6413-5c6a-4512-ab6e-7d5cd1439569":"e92925ed-4a15-40c0-a0a7-a21c965dad48"}'
