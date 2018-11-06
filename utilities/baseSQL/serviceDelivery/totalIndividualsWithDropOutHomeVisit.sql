SELECT DISTINCT
  i.uuid,
  g.name,
  al.type,
  al.title
FROM program_encounter pe
  INNER JOIN program_enrolment enrolment ON pe.program_enrolment_id = enrolment.id
  INNER JOIN program p ON enrolment.program_id = p.id
  INNER JOIN encounter_type et ON pe.encounter_type_id = et.id
  INNER JOIN individual i ON enrolment.individual_id = i.id
  INNER JOIN gender g ON i.gender_id = g.id
  INNER JOIN address_level_type_view al ON i.address_id = al.id
WHERE p.name = 'Adolescent' AND et.name = 'Dropout Home Visit' AND pe.encounter_date_time IS NOT NULL