SYSTEM drop  table if exists test;

CREATE TABLE test
(
    id Int32,
    key String
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

INSERT INTO test SELECT
    number,
    toString(number)
FROM numbers(1000000);

SELECT count()
FROM test;