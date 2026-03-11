SELECT 1
FROM
    (
        SELECT 1
    ) AS tx
LEFT JOIN (
        SELECT 1 AS c0
    ) AS tz
    ON true
WHERE tz.c0 = materialize(1);