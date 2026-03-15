CREATE TABLE t_merge_tree(time Date, id String , name String) ENGINE = MergeTree() PARTITION BY time ORDER BY id;
CREATE TABLE t_replicated_merge_tree(time Date, id String, name String) ENGINE = ReplicatedMergeTree('/test/02352/{database}/t_rep','1') PARTITION BY time ORDER BY id;
SELECT COUNT() FROM t_merge_tree;
SELECT COUNT() FROM t_replicated_merge_tree;
