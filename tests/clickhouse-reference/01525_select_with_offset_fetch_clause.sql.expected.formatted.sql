SELECT number
FROM numbers(10)
ORDER BY number DESC
LIMIT 3 WITH TIES
OFFSET 2;

CREATE TABLE test_fetch
(
    a Int32,
    b Int32
)
ENGINE = Memory;

SELECT *
FROM (
        SELECT *
        FROM test_fetch
        ORDER BY
            a ASC,
            b ASC
        LIMIT 3
        OFFSET 1
    )
ORDER BY
    a ASC,
    b ASC;

SELECT *
FROM (
        SELECT *
        FROM test_fetch
        ORDER BY a ASC
        LIMIT 3 WITH TIES
        OFFSET 1
    )
ORDER BY
    a ASC,
    b ASC;