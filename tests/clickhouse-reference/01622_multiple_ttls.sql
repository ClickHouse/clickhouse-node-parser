CREATE TABLE ttl_where
(
    `d` Date,
    `i` UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
TTL d + toIntervalYear(10) DELETE WHERE i % 3 = 0,
    d + toIntervalYear(40) DELETE WHERE i % 3 = 1;
SELECT * FROM ttl_where ORDER BY d, i;
CREATE TABLE ttl_group_by
(
    `d` Date,
    `i` UInt32,
    `v` UInt64
)
ENGINE = MergeTree
ORDER BY (toStartOfMonth(d), i % 10)
TTL d + toIntervalYear(10) GROUP BY toStartOfMonth(d), i % 10 SET d = any(toStartOfMonth(d)), i = any(i % 10), v = sum(v),
    d + toIntervalYear(40) GROUP BY toStartOfMonth(d) SET d = any(toStartOfMonth(d)), v = sum(v);
SELECT * FROM ttl_group_by ORDER BY d, i;
