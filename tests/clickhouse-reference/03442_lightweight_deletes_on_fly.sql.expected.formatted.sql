CREATE TABLE test_deletes
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY a;

SET mutations_sync = 0;

SET lightweight_deletes_sync = 0;

SELECT a
FROM test_deletes
SETTINGS apply_mutations_on_fly = 1;

CREATE TABLE test_deletes
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY a;

SELECT count()
FROM test_deletes
SETTINGS apply_mutations_on_fly = 1;