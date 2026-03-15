-- https://github.com/ClickHouse/ClickHouse/issues/39855
SET enable_analyzer = 1;

CREATE TABLE x
(
    a UInt64,
    `sipHash64(a)` UInt64
)
ENGINE = MergeTree
ORDER BY a;

SELECT
    a,
    sipHash64(a)
FROM x
ORDER BY sipHash64(a) ASC;

SELECT
    a,
    sipHash64(a)
FROM x
ORDER BY `sipHash64(a)` ASC;