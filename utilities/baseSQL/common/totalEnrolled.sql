SELECT
  DISTINCT
  i.uuid  uuid,
  g.name  gender_name,
  a.type  address_type,
  a.title address_name
FROM
  program_encounter pe
  LEFT OUTER JOIN encounter_type et ON et.id = pe.encounter_type_id
  LEFT OUTER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  LEFT OUTER JOIN program p ON enrolment.program_id = p.id
  LEFT OUTER JOIN individual i ON enrolment.individual_id = i.id
  LEFT OUTER JOIN gender g ON g.id = i.gender_id
  LEFT OUTER JOIN address_level a ON i.address_id = a.id
WHERE p.name = 'Adolescent' AND et.name = 'Annual Visit'