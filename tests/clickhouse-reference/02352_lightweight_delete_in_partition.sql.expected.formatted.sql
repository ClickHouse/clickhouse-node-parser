SYSTEM DROP  TABLE IF EXISTS t_merge_tree SYNC;

SYSTEM DROP  TABLE IF EXISTS t_replicated_merge_tree SYNC;

CREATE TABLE t_merge_tree
(
    time Date,
    id String,
    name String
)
ENGINE = MergeTree()
ORDER BY id
PARTITION BY time;

CREATE TABLE t_replicated_merge_tree
(
    time Date,
    id String,
    name String
)
ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_rep', '1')
ORDER BY id
PARTITION BY time;

INSERT INTO t_merge_tree SELECT
    '2024-08-01',
    '1',
    toString(number)
FROM numbers(100);

INSERT INTO t_merge_tree SELECT
    '2024-08-02',
    '1',
    toString(number)
FROM numbers(100);

INSERT INTO t_replicated_merge_tree SELECT
    '2024-08-01',
    '1',
    toString(number)
FROM numbers(100);

INSERT INTO t_replicated_merge_tree SELECT
    '2024-08-02',
    '1',
    toString(number)
FROM numbers(100);

SELECT COUNT()
FROM t_merge_tree;

SELECT COUNT()
FROM t_replicated_merge_tree;

SYSTEM DROP  TABLE t_merge_tree SYNC;

SYSTEM DROP  TABLE t_replicated_merge_tree SYNC;