SET replication_alter_partitions_sync = 2;

SET mutations_sync = 2;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE replicated_alter1
(
    d Date,
    k UInt64,
    i32 Int32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00062/alter', 'r1', d, k, 8192);

CREATE TABLE replicated_alter2
(
    d Date,
    k UInt64,
    i32 Int32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00062/alter', 'r2', d, k, 8192);

INSERT INTO replicated_alter1;

SELECT *
FROM replicated_alter1
ORDER BY k ASC;

INSERT INTO replicated_alter1;

INSERT INTO replicated_alter1;

INSERT INTO replicated_alter1;

INSERT INTO replicated_alter1;