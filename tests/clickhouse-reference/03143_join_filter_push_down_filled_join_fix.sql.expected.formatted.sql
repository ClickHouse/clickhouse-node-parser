SELECT *
FROM
    t1
LEFT JOIN d2
    ON d2.id = t1.external_id
WHERE t1.id = 1
LIMIT 1;