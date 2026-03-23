SET enable_analyzer = 1;

DROP TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

INSERT INTO test_table;

SELECT (
        SELECT 1
    );

SELECT (
        SELECT id
        FROM test_table
    );

SELECT (
        SELECT value
        FROM test_table
    );

SELECT (
        SELECT
            id,
            value
        FROM test_table
    );

SELECT a
FROM (
        SELECT 1 AS a
    ) AS b;

SELECT b.a
FROM (
        SELECT 1 AS a
    ) AS b;

SELECT *
FROM (
        SELECT *
        FROM (
                SELECT *
                FROM test_table
            )
    );

SELECT *
FROM (
        SELECT
            id,
            value
        FROM (
                SELECT *
                FROM test_table
            )
    );

DROP TABLE test_table;