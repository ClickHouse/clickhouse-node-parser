-- Tags: zookeeper, no-replicated-database, no-shared-merge-tree
-- Tag no-replicated-database: Old syntax is not allowed
-- no-shared-merge-tree: implemented replacement
DROP TABLE IF EXISTS alter_00121;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE alter_00121
(
    d Date,
    x UInt8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/alter_00121/t1', 'r1', d, (d), 8192);

INSERT INTO alter_00121;

DROP TABLE alter_00121;

CREATE TABLE alter_00121
(
    d Date
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/alter_00121/t2', 'r1', d, (d), 8192);

INSERT INTO alter_00121;

SELECT *
FROM alter_00121
ORDER BY d ASC;

INSERT INTO alter_00121;