-- Tags: long, replica, no-replicated-database, no-shared-merge-tree
-- Tag no-replicated-database: Old syntax is not allowed
-- no-shared-merge-tree -- old syntax not supported, for new syntax additional test

SET optimize_on_insert = 0;
SET send_logs_level = 'fatal';
DROP TABLE IF EXISTS old_style;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE old_style(d Date, x UInt32) ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_00754/old_style', 'r1', d, x, 8192);
DROP TABLE old_style;
DROP TABLE IF EXISTS summing_r1;
DROP TABLE IF EXISTS summing_r2;
CREATE TABLE summing_r1(x UInt32, y UInt32, val UInt32) ENGINE ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test_00754/summing', 'r1') ORDER BY (x, y);
CREATE TABLE summing_r2(x UInt32, y UInt32, val UInt32) ENGINE ReplicatedSummingMergeTree('/clickhouse/tables/{database}/test_00754/summing', 'r2') ORDER BY (x, y);
INSERT INTO summing_r1(x, y, z, val) values (1, 2, 0, 10), (1, 2, 1, 30), (1, 2, 2, 40);
SELECT * FROM summing_r2;
INSERT INTO summing_r1(x, y, z, val) values (1, 2, 0, 20), (1, 2, 2, 50);
SELECT * FROM summing_r2 FINAL ORDER BY x, y, z;
DROP TABLE summing_r1;
DROP TABLE summing_r2;
