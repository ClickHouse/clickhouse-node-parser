SYSTEM drop  table if exists test;

CREATE TABLE test
(
    day Date,
    id UInt32
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY day;

INSERT INTO test SELECT
    toDate('2023-01-05') AS day,
    number
FROM numbers(10);

SYSTEM drop  table test;