CREATE TABLE nested
(
    x UInt64,
    filter UInt8,
    n Nested(a UInt64)
)
ENGINE = MergeTree
ORDER BY x
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT DISTINCT n.b
FROM nested
PREWHERE filter
ORDER BY `ALL` ASC;

SELECT DISTINCT n.c
FROM nested
PREWHERE filter
ORDER BY `ALL` ASC;

SELECT DISTINCT
    n.a,
    n.c
FROM nested
PREWHERE filter
ORDER BY `ALL` ASC;