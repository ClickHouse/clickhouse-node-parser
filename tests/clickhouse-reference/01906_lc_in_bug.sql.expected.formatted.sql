CREATE TABLE tab
(
    x LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT
    count() AS c,
    x IN ('a', 'bb') AS g
FROM tab
GROUP BY g
ORDER BY c ASC;

-- https://github.com/ClickHouse/ClickHouse/issues/44503
CREATE TABLE test
(
    key Int32
)
ENGINE = MergeTree
ORDER BY (key)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT COUNT()
FROM test
WHERE key <= 100000
    AND (NOT toLowCardinality('') IN (
        SELECT ''
    ));