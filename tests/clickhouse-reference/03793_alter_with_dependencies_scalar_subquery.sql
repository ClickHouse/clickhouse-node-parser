SET mutations_sync = 1;
CREATE TABLE foo_without_dependencies (ts DateTime, x UInt64)
    ENGINE = MergeTree PARTITION BY toYYYYMMDD(ts) ORDER BY (ts);
SELECT 'foo_without_dependencies', x from foo_without_dependencies ORDER BY x;
CREATE TABLE foo_with_index (ts DateTime, x UInt64, INDEX minmax_x x TYPE minmax GRANULARITY 1)
    ENGINE = MergeTree PARTITION BY toYYYYMMDD(ts) ORDER BY (ts);
SELECT 'foo_with_index', x from foo_with_index ORDER BY x;
-- With a projection
CREATE TABLE foo_with_projection (ts DateTime, x UInt64, PROJECTION pj (SELECT ts, x ORDER BY x))
    ENGINE = MergeTree PARTITION BY toYYYYMMDD(ts) ORDER BY (ts);
SELECT 'foo_with_projection', x from foo_with_projection ORDER BY x;
