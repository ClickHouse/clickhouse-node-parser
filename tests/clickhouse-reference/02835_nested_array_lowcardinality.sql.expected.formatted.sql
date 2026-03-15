CREATE TABLE IF NOT EXISTS cool_table
(
    id UInt64,
    n Nested(n UInt64, lc1 LowCardinality(String))
)
ENGINE = MergeTree
ORDER BY id;

SELECT
    n.lc1,
    n.lc2
FROM cool_table
ORDER BY id ASC;

CREATE TABLE IF NOT EXISTS cool_table
(
    id UInt64,
    n Nested(n UInt64, lc1 Array(LowCardinality(String)))
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE IF NOT EXISTS cool_table
(
    id UInt64,
    n Nested(n UInt64, lc1 Map(LowCardinality(String), UInt64))
)
ENGINE = MergeTree
ORDER BY id;