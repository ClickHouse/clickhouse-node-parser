SELECT 'a';

SELECT DISTINCT 'a';

SELECT *
FROM (
        SELECT 1
        UNION ALL
        SELECT 1
    );

SELECT DISTINCT *
FROM (
        SELECT 2
        UNION ALL
        SELECT 2
    );

SELECT sum(number)
FROM numbers(10);

SELECT sum(number)
FROM numbers(10);

SELECT sumDistinct(number)
FROM numbers(10);

SELECT sum(x)
FROM (
        SELECT 1 AS x
        UNION ALL
        SELECT 1
    );

SELECT sumDistinct(x)
FROM (
        SELECT 1 AS x
        UNION ALL
        SELECT 1
    );

SELECT sum(`ALL`)
FROM (
        SELECT 1 AS `ALL`
    );

SELECT sum(`DISTINCT`)
FROM (
        SELECT 1 AS `DISTINCT`
    );

SELECT repeat('a', `ALL`)
FROM (
        SELECT number AS `ALL`
        FROM numbers(10)
    );

SELECT repeat('a', `DISTINCT`)
FROM (
        SELECT number AS `DISTINCT`
        FROM numbers(10)
    );

SELECT repeat(`ALL`, 5)
FROM (
        SELECT 'a' AS `ALL`
    );

SELECT repeat(`DISTINCT`, 5)
FROM (
        SELECT 'a' AS `DISTINCT`
    );

SELECT repeat(`ALL`, `DISTINCT`)
FROM (
        SELECT
            'a' AS `ALL`,
            5 AS `DISTINCT`
    );