set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE alter_00121 (d Date, x UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/alter_00121/t1', 'r1', d, (d), 8192);
CREATE TABLE alter_00121 (d Date) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test/alter_00121/t2', 'r1', d, (d), 8192);
SELECT * FROM alter_00121 ORDER BY d;
