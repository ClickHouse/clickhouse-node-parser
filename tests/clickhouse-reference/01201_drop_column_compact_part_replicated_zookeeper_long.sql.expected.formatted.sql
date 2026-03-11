SELECT *
FROM mt_compact
ORDER BY
    a ASC,
    s ASC
LIMIT 10;

SELECT *
FROM mt_compact
WHERE a > 1
ORDER BY
    a ASC,
    s ASC
LIMIT 10;