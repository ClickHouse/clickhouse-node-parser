CREATE TABLE ttl_where
(
    d Date,
    i UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
TTL d + toIntervalYear(10) WHERE i % 3 = 0,
    d + toIntervalYear(40) WHERE i % 3 = 1;

SELECT *
FROM ttl_where
ORDER BY
    d ASC,
    i ASC;

CREATE TABLE ttl_group_by
(
    d Date,
    i UInt32,
    v UInt64
)
ENGINE = MergeTree
ORDER BY (toStartOfMonth(d), i % 10)
TTL d + toIntervalYear(10),
    d + toIntervalYear(40);

SELECT *
FROM ttl_group_by
ORDER BY
    d ASC,
    i ASC;