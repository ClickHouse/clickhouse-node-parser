SELECT avg(-8000000000000000000)
FROM (
        SELECT
            *,
            1 AS k
        FROM numbers(65535 * 2)
    )
GROUP BY k;

SELECT avg(-8000000000000000000)
FROM numbers(65535 * 2);

SELECT avg(toNullable(-8000000000000000000))
FROM numbers(65535 * 2);