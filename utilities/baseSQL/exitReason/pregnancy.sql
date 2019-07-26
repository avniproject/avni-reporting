SELECT DISTINCT i.uuid              uuid,
                i.gender            gender_name,
                i.addresslevel_type address_type,
                i.addresslevel_name address_name
FROM program_enrolment_view enrolment
       LEFT OUTER JOIN individual_gender_address_view i ON enrolment.individual_id = i.id
WHERE program_exit_date_time NOTNULL
  AND enrolment.program_name = 'Adolescent'
  AND enrolment.program_exit_observations @>
      '{"04d33465-0cd3-4755-8329-b057a3d8f707":"adc37af2-06c1-4adf-9f10-0e121b8a49b8"}'
