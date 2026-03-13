SELECT *
FROM (
        EXPLAIN indexes = 1, actions = 1, distributed = 1
        SELECT *
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
            )
        WHERE x = 42
    );

--- lambdas are not supported
SELECT *
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE arraySum(arrayMap(y -> y + 1, [x])) = 42;

SELECT *
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE arraySum(arrayMap(y -> x + y + 2, [x])) = 42;

SELECT *
FROM (
        EXPLAIN indexes = 1, actions = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
            )
        WHERE x = 42
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, actions = 1, distributed = 1
        SELECT *
        FROM (
                SELECT
                    x,
                    sum(y)
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
                GROUP BY x
            )
        WHERE x = 42
    );

--- IN is supported
SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
            )
        WHERE x IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

--- GLOBAL IN is replaced to temporary table
SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.2', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.2', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.1', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.1', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{2,3}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.{2,3}', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT sum(y)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2,3}', currentDatabase(), tab0)
    )
WHERE x GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(y)
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2,3}', currentDatabase(), tab0)
            )
        WHERE x GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT sum(x)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2,3}', currentDatabase(), tab0)
    )
WHERE y GLOBAL IN (
        SELECT number + 42
        FROM numbers(1)
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT sum(x)
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2,3}', currentDatabase(), tab0)
            )
        WHERE y GLOBAL IN (
                SELECT number + 42
                FROM numbers(1)
            )
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, distributed = 1
        SELECT *
        FROM (
                SELECT *
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab1)
            )
        WHERE (tenant,recordTimestamp) IN (
                SELECT
                    tenant,
                    recordTimestamp
                FROM remote('127.0.0.{1,2}', currentDatabase(), tab1)
                WHERE like(colAlias, '%abcd%')
            )
    );

SELECT *
FROM (
        EXPLAIN indexes = 1, actions = 1, distributed = 1
        SELECT *
        FROM test_view
        WHERE n = 100
    );