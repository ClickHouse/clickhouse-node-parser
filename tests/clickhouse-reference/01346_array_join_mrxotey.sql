CREATE TABLE test (
    a Date,
    b UInt32,
    c UInt64,
    p Nested (
        at1 String,
        at2 String
    )
) ENGINE = MergeTree()
PARTITION BY a
ORDER BY b
SETTINGS index_granularity = 8192;
SELECT b
FROM test
ARRAY JOIN p
WHERE
    b = 1
    AND c IN (
        SELECT c FROM test
    );
