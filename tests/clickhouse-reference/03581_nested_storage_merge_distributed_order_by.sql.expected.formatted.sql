SET enable_analyzer = 1;

CREATE TABLE t1
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

CREATE TABLE t2
(
    key Int
)
ENGINE = MergeTree()
ORDER BY key;

CREATE TABLE d1
ENGINE = Distributed('test_shard_localhost', currentDatabase(), t2, rand());

CREATE TABLE m1
ENGINE = Merge(currentDatabase(), '^(t1|d1)$');

CREATE TABLE m2
ENGINE = Merge(currentDatabase(), '^(t1|m1)$');

INSERT INTO t1;

INSERT INTO t1;

SELECT *
FROM m2
ORDER BY key ASC
SETTINGS max_threads = 1;