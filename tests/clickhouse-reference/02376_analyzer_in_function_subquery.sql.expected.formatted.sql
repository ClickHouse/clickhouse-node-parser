SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE test_table_for_in
(
    id UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

-- { echoOn }
SELECT
    id,
    value
FROM test_table
WHERE 1 IN (
        SELECT 1
    );

SELECT '--';

SELECT
    id,
    value
FROM test_table
WHERE 0 IN (
        SELECT 1
    );

SELECT
    id,
    value
FROM test_table
WHERE id IN (
        SELECT 1
    );

SELECT
    id,
    value
FROM test_table
WHERE id IN (
        SELECT 2
    );

SELECT
    id,
    value
FROM test_table
WHERE id IN (test_table_for_in);

SELECT
    id,
    value
FROM test_table
WHERE id IN (
        SELECT id
        FROM test_table_for_in
    );

SELECT
    id,
    value
FROM test_table
WHERE id IN (
        SELECT id
        FROM test_table_for_in
        UNION DISTINCT
        SELECT id
        FROM test_table_for_in
    );