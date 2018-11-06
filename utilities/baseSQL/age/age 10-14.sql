SELECT
  i.uuid uuid,
  g.name    gender_name,
  a.type    address_type,
  a.title   address_name
FROM individual i
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
WHERE extract(YEAR FROM age(i.date_of_birth)) >= 10 AND extract(YEAR FROM age(i.date_of_birth)) <= 14