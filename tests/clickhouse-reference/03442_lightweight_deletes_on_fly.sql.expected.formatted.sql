SYSTEM DROP  TABLE IF EXISTS test_deletes;

CREATE TABLE test_deletes
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY a;

INSERT INTO test_deletes;

SET mutations_sync = 0;

SET lightweight_deletes_sync = 0;

SELECT a
FROM test_deletes
SETTINGS apply_mutations_on_fly = 1;

SYSTEM DROP  TABLE test_deletes;

CREATE TABLE test_deletes
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY a;

INSERT INTO test_deletes SELECT
    number,
    0
FROM numbers(10000);

SELECT count()
FROM test_deletes
SETTINGS apply_mutations_on_fly = 1;