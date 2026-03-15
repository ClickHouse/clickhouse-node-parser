-- Test from https://github.com/ClickHouse/ClickHouse/issues/29729
CREATE TABLE data_02053
(
    id Int64,
    A Nullable(Int64),
    X Int64 MATERIALIZED coalesce(A, -1)
)
ENGINE = MergeTree
ORDER BY id;

SELECT
    *,
    X
FROM data_02053
ORDER BY id ASC;