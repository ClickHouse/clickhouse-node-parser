SELECT *
FROM xp
WHERE i IN (
        SELECT *
        FROM numbers(2)
    );

SELECT *
FROM xp
WHERE i GLOBAL IN (
        SELECT *
        FROM numbers(2)
    );

SELECT *
FROM xp_d
WHERE i IN (
        SELECT *
        FROM numbers(2)
    );

SELECT *
FROM xp_d
WHERE i GLOBAL IN (
        SELECT *
        FROM numbers(2)
    );