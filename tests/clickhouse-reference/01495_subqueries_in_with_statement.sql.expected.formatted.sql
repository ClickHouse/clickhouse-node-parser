SELECT *
FROM
    (
        WITH test1 AS (
            SELECT toInt32(*) AS i
            FROM numbers(5)
        )

        SELECT *
        FROM test1
    ) AS l
INNER JOIN test1 AS r
    ON (l.i == r.i);

SELECT '---------------------------';