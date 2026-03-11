SELECT count(1)
FROM (
        SELECT
            1 AS a,
            count(1)
        FROM numbers(5)
    );

SELECT count(1)
FROM (
        SELECT
            1 AS a,
            count(1) + 1
        FROM numbers(5)
    );