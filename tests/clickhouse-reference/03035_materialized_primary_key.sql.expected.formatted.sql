CREATE TABLE test
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test;

CREATE MATERIALIZED VIEW test_mv
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
FROM test;

CREATE MATERIALIZED VIEW test_mv_pk
(
    value String,
    id UInt64
)
ENGINE = MergeTree
PRIMARY KEY value
POPULATE
AS
SELECT
    value,
    id
FROM test;

SELECT
    name,
    primary_key
FROM `system`.tables
WHERE database = currentDatabase()
    AND like(name, 'test%');