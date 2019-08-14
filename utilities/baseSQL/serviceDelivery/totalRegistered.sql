SELECT
  i.uuid  uuid,
  i.gender as gender_name,
  i.addresslevel_type as address_type,
  i.addresslevel_name as address_name
FROM individual_gender_address_view i
WHERE 1 = 1
