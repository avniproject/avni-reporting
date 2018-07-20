SELECT
    DISTINCT
    i.uuid  uuid,
    g.name  gender_name,
    a.type  address_type,
    a.title address_name
FROM
    individual i
    LEFT OUTER JOIN gender g ON g.id = i.gender_id
    LEFT OUTER JOIN address_level a ON i.address_id = a.id