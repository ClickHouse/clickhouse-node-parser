CREATE TABLE test_xy
(
    x Int32,
    y String
)
ENGINE = MergeTree
ORDER BY x;

CREATE TABLE updates
(
    x Int32,
    y String
)
ENGINE = MergeTree
ORDER BY x;

SELECT
    x,
    y,
    transform(x, (
        SELECT groupArray(x)
        FROM (
                SELECT
                    x,
                    y
                FROM updates
                ORDER BY x ASC
            ) AS t1
    ), (
        SELECT groupArray(y)
        FROM (
                SELECT
                    x,
                    y
                FROM updates
                ORDER BY x ASC
            ) AS t2
    ), y)
FROM test_xy
WHERE 1
ORDER BY
    x ASC,
    y ASC;

SET mutations_sync = 1;

SELECT *
FROM test_xy
ORDER BY
    x ASC,
    y ASC;