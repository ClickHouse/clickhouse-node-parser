CREATE TABLE test
(
    id Int32,
    key String
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT count()
FROM test;