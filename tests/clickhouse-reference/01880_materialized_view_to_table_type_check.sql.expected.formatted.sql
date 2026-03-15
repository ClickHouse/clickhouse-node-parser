CREATE TABLE test_input
(
    id Int32
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE test
(
    id Int32,
    pv AggregateFunction(sum, Int32)
)
ENGINE = AggregatingMergeTree()
ORDER BY id;

CREATE MATERIALIZED VIEW test_mv
TO test
(
    id Int32,
    pv AggregateFunction(sum, Int32)
)
AS
SELECT
    id,
    sumState(1) AS pv
FROM test_input
GROUP BY id; -- { serverError CANNOT_CONVERT_TYPE }

SELECT '----------test--------:';

SELECT *
FROM test;

CREATE MATERIALIZED VIEW test_mv
TO test
(
    id Int32,
    pv AggregateFunction(sum, Int32)
)
AS
SELECT
    id,
    sumState(toInt32(1)) AS pv
FROM test_input
GROUP BY id;