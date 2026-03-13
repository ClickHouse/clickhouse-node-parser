-- { echo }
SELECT count()
FROM (
        SELECT *
        FROM test
        UNION DISTINCT
        SELECT *
        FROM test
    );

SELECT count()
FROM (
(        SELECT *
        FROM test
        UNION DISTINCT
        SELECT *
        FROM test)
        UNION ALL
        SELECT *
        FROM test
    );

SELECT count()
FROM (
(        SELECT *
        FROM test
        UNION DISTINCT
        SELECT *
        FROM test)
EXCEPT
        SELECT *
        FROM test
        WHERE name = '3'
    );

SELECT count()
FROM (
((        SELECT *
        FROM test
INTERSECT
(        SELECT *
        FROM test
        WHERE toUInt8(name) < 4))
        UNION DISTINCT
(        SELECT *
        FROM test
        WHERE name = '5'
            OR name = '1'))
EXCEPT
        SELECT *
        FROM test
        WHERE name = '3'
    );

SELECT uuid
FROM test
UNION DISTINCT
SELECT uuid
FROM test;

(SELECT uuid
FROM test
UNION DISTINCT
SELECT uuid
FROM test)
UNION ALL
SELECT uuid
FROM test
WHERE name = '1';

SELECT uuid
FROM (
        SELECT *
        FROM test
        UNION DISTINCT
        SELECT *
        FROM test
    );