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

SELECT COUNT()
FROM t_merge_tree;

SELECT COUNT()
FROM t_replicated_merge_tree;