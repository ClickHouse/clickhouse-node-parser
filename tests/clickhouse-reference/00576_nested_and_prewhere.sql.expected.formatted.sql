CREATE TABLE nested
(
    x UInt64,
    filter UInt8,
    n Nested(a UInt64)
)
ENGINE = MergeTree
ORDER BY x
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO nested SELECT
    number,
    number % 2,
    range(number % 10)
FROM `system`.numbers
LIMIT 100000;

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