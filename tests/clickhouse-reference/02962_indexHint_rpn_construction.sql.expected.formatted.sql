CREATE TABLE tab
(
    foo Array(LowCardinality(String)),
    INDEX idx foo TYPE bloom_filter GRANULARITY 1
)
ENGINE = MergeTree
PRIMARY KEY tuple();

SELECT *
FROM tab
PREWHERE indexHint(indexHint(-1, 0.))
WHERE has(foo, 'b');

SELECT *
FROM tab
PREWHERE indexHint(0);