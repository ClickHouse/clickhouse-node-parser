CREATE TABLE t
(
    x UInt64,
    y String
)
ENGINE = MergeTree()
ORDER BY x
SETTINGS index_granularity = 999999999, index_granularity_bytes = 99999999999, use_const_adaptive_granularity = 0, min_bytes_for_wide_part = 0;

INSERT INTO t SETTINGS max_insert_block_size = 2000000 SELECT
    number,
    toString(number)
FROM numbers(10000)
SETTINGS max_block_size = 2000000;

SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 't'
    AND name = 'p3';

SELECT marks
FROM `system`.projection_parts
WHERE active
    AND database = currentDatabase()
    AND table = 't'
    AND name = 'p4';

SELECT
    name,
    `settings`
FROM `system`.projections
WHERE database = currentDatabase()
    AND table = 't'
ORDER BY name ASC;

CREATE TABLE t
(
    x UInt64,
    y String
)
ENGINE = MergeTree()
ORDER BY x
SETTINGS index_granularity_bytes = 0;

-- Check if projection with settings can be created and checked properly.
CREATE TABLE t
(
    x UInt64,
    y String,
    PROJECTION p1 (    SELECT x
    ORDER BY x ASC) WITH SETTINGS(index_granularity = 2, index_granularity_bytes = 999999999)
)
ENGINE = MergeTree()
ORDER BY x
SETTINGS index_granularity = 999999999, index_granularity_bytes = 99999999999, use_const_adaptive_granularity = 0, min_bytes_for_wide_part = 0;

CREATE TABLE t
(
    x UInt64,
    y String,
    PROJECTION p1 (    SELECT x
    ORDER BY x ASC) WITH SETTINGS(index_granularity = 2)
)
ENGINE = MergeTree()
ORDER BY x
SETTINGS index_granularity_bytes = 0; -- { serverError SUPPORT_IS_DISABLED }