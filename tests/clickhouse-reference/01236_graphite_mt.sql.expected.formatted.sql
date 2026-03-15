CREATE TABLE test_graphite
(
    key UInt32,
    Path String,
    Time DateTime('UTC'),
    Value Float64,
    Version UInt32,
    col UInt64
)
ENGINE = GraphiteMergeTree('graphite_rollup')
ORDER BY key
SETTINGS index_granularity = 10;

SET joined_subquery_requires_alias = 0;

SELECT
    key,
    Path,
    Value,
    Version,
    col
FROM test_graphite FINAL
ORDER BY
    key ASC,
    Path ASC,
    Time DESC;

SELECT
    key,
    Path,
    Value,
    Version,
    col
FROM test_graphite
ORDER BY
    key ASC,
    Path ASC,
    Time DESC;