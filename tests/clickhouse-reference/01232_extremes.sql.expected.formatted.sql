SELECT *
FROM remote('127.0.0.1', numbers(2));

SELECT *
FROM remote('127.0.0.{1,1}', numbers(2));

SELECT *
FROM remote('127.0.0.{1,2}', numbers(2));

SELECT *
FROM remote('127.0.0.{2,2}', numbers(2));

SELECT *
FROM remote('127.0.0.2', numbers(2));

SELECT '------';

SELECT *
FROM (
        SELECT *
        FROM numbers(2)
        UNION ALL
        SELECT *
        FROM numbers(3)
        UNION ALL
        SELECT *
        FROM numbers(1)
    )
ORDER BY number ASC;

SELECT *
FROM (
        SELECT *
        FROM numbers(1)
        UNION ALL
        SELECT *
        FROM numbers(2)
        UNION ALL
        SELECT *
        FROM numbers(3)
    )
ORDER BY number ASC;

SELECT *
FROM (
        SELECT *
        FROM numbers(3)
        UNION ALL
        SELECT *
        FROM numbers(1)
        UNION ALL
        SELECT *
        FROM numbers(2)
    )
ORDER BY number ASC;

SELECT *
FROM distr
ORDER BY number ASC;

SELECT *
FROM distr2
ORDER BY number ASC;