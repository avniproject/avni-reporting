SELECT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM individual i
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  INNER JOIN address_level_type_view a ON i.address_id = a.id
  INNER JOIN program_enrolment enrolment ON i.id = enrolment.individual_id
  INNER JOIN program p ON enrolment.program_id = p.id
WHERE p.name = 'Adolescent'