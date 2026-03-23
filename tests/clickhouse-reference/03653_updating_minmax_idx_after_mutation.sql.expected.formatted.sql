CREATE TABLE test
(
    time DateTime
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toYYYYMM(time);

INSERT INTO test;

SELECT max_time
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test'
    AND active;

SET mutations_sync = 1;