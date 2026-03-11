SELECT count(*)
FROM
    numbers(2) AS n1
CROSS JOIN numbers(3) AS n2
CROSS JOIN numbers(4) AS n3
WHERE (n1.number = n2.number)
    AND (n2.number = n3.number);

SELECT count(*) AS c
FROM (
        SELECT
            count(*),
            count(*) AS c
        FROM
            numbers(2) AS n1
        CROSS JOIN numbers(3) AS n2
        CROSS JOIN numbers(4) AS n3
        WHERE (n1.number = n2.number)
            AND (n2.number = n3.number)
            AND (
                SELECT count(*)
                FROM numbers(1)
            ) = 1
    )
WHERE (
        SELECT count(*)
        FROM numbers(2)
    ) = 2
HAVING c IN (
        SELECT count(*) AS c
        FROM numbers(1)
    );