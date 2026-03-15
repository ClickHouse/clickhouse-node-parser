CREATE TABLE lc_prewhere
(
    key UInt64,
    val UInt64,
    str LowCardinality(String),
    s String
)
ENGINE = MergeTree
ORDER BY key
SETTINGS index_granularity = 8192;

SELECT
    sum(toUInt64(str)),
    sum(toUInt64(s))
FROM lc_prewhere
PREWHERE val == 1;