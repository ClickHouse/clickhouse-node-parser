-- Testing basic functionality with compact parts
SET mutations_sync = 2;

SYSTEM drop  table if exists mt_compact;

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

INSERT INTO mt_compact (a, s, n.y, lc) SELECT
    number,
    toString(((number * 2132214234 + 5434543)) % 2133443),
    ['a', 'b', 'c'],
    if(number % 2, 'bar', 'baz')
FROM numbers(90);

SELECT *
FROM mt_compact
ORDER BY a ASC
LIMIT 10;

SELECT DISTINCT part_type
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'mt_compact'
    AND active;

INSERT INTO mt_compact (a, s, n.x, lc) SELECT
    number % 3,
    toString(((number * 75434535 + 645645)) % 2133443),
    [1, 2],
    toString(number)
FROM numbers(5);

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