SELECT
    t1.id,
    t2.id AS id,
    t3.id AS value
FROM
    (
        SELECT
            number AS id,
            42 AS value
        FROM numbers(4)
    ) AS t1
LEFT JOIN (
        SELECT
            number AS id,
            42 AS value
        FROM numbers(3)
    ) AS t2
    ON t1.id = t2.id
LEFT JOIN (
        SELECT
            number AS id,
            42 AS value
        FROM numbers(2)
    ) AS t3
    ON t1.id = t3.id
WHERE id > 0
    AND value < 42
ORDER BY id ASC;

SELECT *
FROM view1
WHERE id = 1
ORDER BY id ASC;