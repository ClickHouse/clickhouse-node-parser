SET mutations_sync = 1;

-- No dependencies
DROP TABLE IF EXISTS foo_without_dependencies;

CREATE TABLE foo_without_dependencies
(
    ts DateTime,
    x UInt64
)
ENGINE = MergeTree
ORDER BY (ts)
PARTITION BY toYYYYMMDD(ts);

INSERT INTO foo_without_dependencies (ts, x) SELECT
    toDateTime('2020-01-01 00:05:00'),
    number + 1
FROM `system`.numbers
LIMIT 10;

SELECT
    'foo_without_dependencies',
    x
FROM foo_without_dependencies
ORDER BY x ASC;

-- With an index
DROP TABLE IF EXISTS foo_with_index;

CREATE TABLE foo_with_index
(
    ts DateTime,
    x UInt64,
    INDEX minmax_x x TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY (ts)
PARTITION BY toYYYYMMDD(ts);

INSERT INTO foo_with_index (ts, x) SELECT
    toDateTime('2020-01-01 00:05:00'),
    number + 1
FROM `system`.numbers
LIMIT 10;

SELECT
    'foo_with_index',
    x
FROM foo_with_index
ORDER BY x ASC;

-- With a projection
CREATE TABLE foo_with_projection
(
    ts DateTime,
    x UInt64,
    PROJECTION pj (    SELECT
        ts,
        x
    ORDER BY x ASC)
)
ENGINE = MergeTree
ORDER BY (ts)
PARTITION BY toYYYYMMDD(ts);

INSERT INTO foo_with_projection (ts, x) SELECT
    toDateTime('2020-01-01 00:05:00'),
    number + 1
FROM `system`.numbers
LIMIT 10;

SELECT
    'foo_with_projection',
    x
FROM foo_with_projection
ORDER BY x ASC;

DROP TABLE IF EXISTS foo_with_projection;