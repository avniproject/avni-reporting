select grant_all_on_common_views(array [
'operational_program_view',
'operational_encounter_type_view',
'program_enrolment_view',
'non_exited_program_enrolment_view',
'program_encounter_view',
'completed_program_encounter_view',
'unplanned_program_encounter_view',
'planned_program_encounter_view',
'non_cancelled_planned_program_encounter_view',
'cancelled_planned_program_encounter_view',
'incomplete_planned_program_encounter_view',
'individual_view',
'individual_gender_view',
'individual_gender_address_view',
'individual_gender_catchment_view',
'all_enrolment_completed_encounters_agg_view',
'non_exited_enrolment_completed_encounters_agg_view',
'all_completed_encounters_per_enrolment_agg_view',
'individual_relationship_view',
'individual_all_relationships_view',
'individual_name_relationship_view',
'encounter_view',
'checklist_view',
'checklist_item_reference',
'checklist_item_view',
'checklist_item_checklist_view',
'latest_program_encounter',
'boolean',
'location_view'
], a.rolname)

FROM pg_roles a
WHERE pg_has_role('openchs', a.oid, 'member')
  and a.rolsuper is false
  and a.rolname not like 'pg%'
  and a.rolname not like 'rds%'
order by a.rolname;
