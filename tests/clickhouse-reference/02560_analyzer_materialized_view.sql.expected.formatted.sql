SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

CREATE MATERIALIZED VIEW test_materialized_view
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id
AS
SELECT
    id,
    value
FROM test_table;

SELECT
    id,
    value
FROM test_materialized_view
ORDER BY id ASC;

SELECT '--';

CREATE TABLE test_table_data
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;