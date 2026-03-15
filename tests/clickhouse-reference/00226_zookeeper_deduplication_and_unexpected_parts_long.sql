set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE deduplication (d Date DEFAULT '2015-01-01', x Int8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00226/deduplication', 'r1', d, x, 1);
SELECT * FROM deduplication;
