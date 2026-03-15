-- Testing basic functionality with compact parts
SET mutations_sync = 2;

CREATE TABLE mt_compact
(
    a UInt64,
    b UInt64 DEFAULT a * a,
    s String,
    n Nested(x UInt32, y String),
    lc LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY a % 10
SETTINGS index_granularity = 8, min_bytes_for_wide_part = 0, min_rows_for_wide_part = 10;

SELECT *
FROM mt_compact
ORDER BY a ASC
LIMIT 10;

SELECT DISTINCT part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'mt_compact'
    AND active;

SELECT
    part_type,
    count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'mt_compact'
    AND active
GROUP BY part_type
ORDER BY part_type ASC;

SELECT *
FROM mt_compact
ORDER BY
    a ASC,
    s ASC
LIMIT 10;

SELECT *
FROM mt_compact
WHERE a > 1
ORDER BY
    a ASC,
    s ASC
LIMIT 10;