CREATE TABLE test
(
    time DateTime
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(time) ORDER BY ();
SELECT max_time FROM system.parts WHERE database = currentDatabase() AND table = 'test' AND active;
SET mutations_sync = 1;
