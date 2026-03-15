CREATE TABLE test
(
    val LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 8192;

SELECT count(val)
FROM test
SETTINGS optimize_use_implicit_projections = 1;