SELECT
  "Report",
  coalesce("Female", 0) "Female",
  coalesce("Male", 0)   "Male"
FROM crosstab('(SELECT
   ''FROM '' || al.type::TEXT,
   g.name::TEXT,
   count(*)::NUMERIC
 FROM individual i
   INNER JOIN gender g ON i.gender_id = g.id
   INNER JOIN address_level al ON i.address_id = al.id
 GROUP BY al.type, g.name
 ORDER BY 1, 2)
UNION ALL
(SELECT
   ''SEX''::TEXT,
   g.name::TEXT,
   count(*)::NUMERIC
 FROM individual i
   INNER JOIN gender g ON i.gender_id = g.id
 GROUP BY g.name
 ORDER BY 1, 2)
UNION ALL
(SELECT
   ''CASTE '' || c.name::TEXT,
   g.name::TEXT,
   count(*) :: NUMERIC
 FROM individual i
   INNER JOIN gender g ON i.gender_id = g.id
   INNER JOIN concept c ON i.observations ->> ''61ab6413-5c6a-4512-ab6e-7d5cd1439569'' = c.uuid
 WHERE i.observations ->> ''61ab6413-5c6a-4512-ab6e-7d5cd1439569'' IS NOT NULL
 GROUP BY g.name, c.name
 ORDER BY 1, 2)
UNION ALL
(SELECT
   CASE WHEN extract(YEAR FROM age(i.date_of_birth)) >= 10 AND extract(YEAR FROM age(i.date_of_birth)) <= 14
     THEN ''Age 10-14''
   ELSE ''Age 15-19'' END,
   g.name :: TEXT,
   count(*) :: NUMERIC
 FROM individual i
   INNER JOIN gender g ON i.gender_id = g.id
 GROUP BY CASE WHEN extract(YEAR FROM age(i.date_of_birth)) >= 10 AND extract(YEAR FROM age(i.date_of_birth)) <= 14
   THEN ''Age 10-14''
          ELSE ''Age 15-19'' END, g.name
 ORDER BY 1, 2)
UNION ALL
(SELECT
   ''Religion '' || c.name::TEXT,
   g.name::TEXT,
   count(*) :: NUMERIC
 FROM individual i
   INNER JOIN gender g ON i.gender_id = g.id
   INNER JOIN concept c ON i.observations ->> ''c922c13c-1fa2-42dd-a7e8-d234b0324870'' = c.uuid
 WHERE i.observations ->> ''c922c13c-1fa2-42dd-a7e8-d234b0324870'' IS NOT NULL
 GROUP BY g.name, c.name
 ORDER BY 1, 2)
UNION ALL
(SELECT
   ''Ration Card '' || c.name::TEXT,
   g.name::TEXT,
   count(*) :: NUMERIC
 FROM individual i
   INNER JOIN gender g ON i.gender_id = g.id
   INNER JOIN concept c ON i.observations ->> ''476a0b71-485b-4a0a-ba6f-4f3cf13568ca'' = c.uuid
 WHERE i.observations ->> ''476a0b71-485b-4a0a-ba6f-4f3cf13568ca'' IS NOT NULL
 GROUP BY g.name, c.name
 ORDER BY 1, 2)') AS ("Report" TEXT, "Female" NUMERIC, "Male" NUMERIC);