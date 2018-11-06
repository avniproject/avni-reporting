SELECT
  i.uuid     uuid,
  g.name  AS gender,
  a.type  AS address_type,
  a.title AS address_name
FROM program_encounter pe
  LEFT OUTER JOIN program_enrolment e ON pe.program_enrolment_id = e.id
  LEFT OUTER JOIN program p ON e.program_id = p.id
  LEFT OUTER JOIN encounter_type et ON pe.encounter_type_id = et.id
  LEFT OUTER JOIN individual i ON e.individual_id = i.id
  LEFT OUTER JOIN gender g ON i.gender_id = g.id
  LEFT OUTER JOIN address_level_type_view a ON i.address_id = a.id
WHERE et.name = 'Dropout Followup Visit' AND et.id IS NOT NULL AND p.name = 'Adolescent'
GROUP BY i.uuid, g.name, a.type, a.title
HAVING count(*) = 5;