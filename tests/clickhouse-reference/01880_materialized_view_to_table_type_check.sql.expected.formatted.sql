DROP TABLE IF EXISTS test_mv;

DROP TABLE IF EXISTS test;

DROP TABLE IF EXISTS test_input;

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

INSERT INTO test_input SELECT toInt32(number % 1000) AS id
FROM numbers(10);

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

INSERT INTO test_input SELECT toInt32(number % 1000) AS id
FROM numbers(100, 3);

DROP TABLE test_mv;

DROP TABLE test;

DROP TABLE test_input;