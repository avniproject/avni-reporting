SELECT i.uuid                 uuid,
       i.gender            as gender_name,
       i.addresslevel_type as address_type,
       i.addresslevel_name as address_name
FROM individual_gender_address_view i
         join program_enrolment_view pev on i.id = pev.individual_id
where program_name = 'Adolescent'
  and enrolment_date_time notnull
   and pev.program_exit_date_time isnull
  and pev.enrolment_date_time between 'FILTERS.start_date' and 'FILTERS.end_date'
