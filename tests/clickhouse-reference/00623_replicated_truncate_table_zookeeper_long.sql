set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE replicated_truncate1 (d Date, k UInt64, i32 Int32) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/test_00623/truncate', 'r1') order by k partition by toYYYYMM(d);
CREATE TABLE replicated_truncate2 (d Date, k UInt64, i32 Int32) ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/test_00623/truncate', 'r2') order by k partition by toYYYYMM(d);
SELECT * FROM replicated_truncate1 ORDER BY k;
SELECT * FROM replicated_truncate2 ORDER BY k;
