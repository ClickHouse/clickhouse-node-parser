SELECT *
FROM xp
WHERE i IN ([0, 1]);

SELECT *
FROM xp
WHERE i GLOBAL IN ([0, 1]);

SELECT *
FROM xp_d
WHERE i IN ([0, 1]);

SELECT *
FROM xp_d
WHERE i GLOBAL IN ([0, 1]);

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

SELECT *
FROM xp
WHERE i IN (NULL);

SELECT *
FROM xp
WHERE i GLOBAL IN (NULL);

SELECT *
FROM xp_d
WHERE i IN (NULL);

SELECT *
FROM xp_d
WHERE i GLOBAL IN (NULL);