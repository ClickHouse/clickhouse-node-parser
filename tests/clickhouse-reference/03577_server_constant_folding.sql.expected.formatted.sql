SET prefer_localhost_replica = 0;

SELECT '-- IN subquery';

SELECT
    shardNum(),
    number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number IN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT
    shardNum(),
    number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number GLOBAL IN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT
    shardNum(),
    number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number IN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
        UNION ALL
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum() * 2
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT
    shardNum(),
    number
FROM remote('127.0.0.{1..3}', numbers(100))
WHERE number GLOBAL IN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
        UNION ALL
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum() * 2
    )
ORDER BY
    1 ASC,
    2 ASC;

SELECT
    shardNum(),
    tab.number
FROM
    remote('127.0.0.{1..3}', numbers(100)) AS tab
INNER JOIN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
    ) AS flt
    ON tab.number = flt.number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS enable_analyzer = 1;

SELECT
    shardNum(),
    number
FROM
    remote('127.0.0.{1..3}', numbers(100))
INNER JOIN (
        SELECT number AS flt_number
        FROM numbers(10)
        WHERE number = shardNum()
    ) AS flt
    ON number = flt_number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS
    enable_analyzer = 0,
    joined_subquery_requires_alias = 0;

SELECT
    shardNum(),
    tab.number
FROM
    remote('127.0.0.{1..3}', numbers(100)) AS tab
INNER JOIN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
    ) AS flt
    ON tab.number = flt.number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS enable_analyzer = 1;

SELECT
    shardNum(),
    number
FROM
    remote('127.0.0.{1..3}', numbers(100))
INNER JOIN (
        SELECT number AS flt_number
        FROM numbers(10)
        WHERE number = shardNum()
    ) AS flt
    ON number = flt_number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS
    enable_analyzer = 0,
    joined_subquery_requires_alias = 0;

SELECT
    shardNum(),
    tab.number
FROM
    remote('127.0.0.{1..3}', numbers(100)) AS tab
INNER JOIN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
        UNION ALL
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum() * 2
    ) AS flt
    ON tab.number = flt.number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS enable_analyzer = 1;

SELECT
    shardNum(),
    number
FROM
    remote('127.0.0.{1..3}', numbers(100))
INNER JOIN (
        SELECT number AS flt_number
        FROM numbers(10)
        WHERE number = shardNum()
        UNION ALL
        SELECT number AS flt_number
        FROM numbers(10)
        WHERE number = shardNum() * 2
    ) AS flt
    ON number = flt_number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS
    enable_analyzer = 0,
    joined_subquery_requires_alias = 0;

SELECT
    shardNum(),
    tab.number
FROM
    remote('127.0.0.{1..3}', numbers(100)) AS tab
INNER JOIN (
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum()
        UNION ALL
        SELECT number
        FROM numbers(10)
        WHERE number = shardNum() * 2
    ) AS flt
    ON tab.number = flt.number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS enable_analyzer = 1;

SELECT
    shardNum(),
    number
FROM
    remote('127.0.0.{1..3}', numbers(100))
INNER JOIN (
        SELECT number AS flt_number
        FROM numbers(10)
        WHERE number = shardNum()
        UNION ALL
        SELECT number AS flt_number
        FROM numbers(10)
        WHERE number = shardNum() * 2
    ) AS flt
    ON number = flt_number
ORDER BY
    1 ASC,
    2 ASC
SETTINGS
    enable_analyzer = 0,
    joined_subquery_requires_alias = 0;