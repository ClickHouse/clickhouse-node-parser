-- Tags: no-replicated-database
-- Tag no-replicated-database: Unsupported type of ALTER query

DROP TABLE IF EXISTS t;
SELECT comment FROM system.tables WHERE database = currentDatabase() AND table = 't';
ALTER TABLE t MODIFY COMMENT 'World';
DROP TABLE t;
CREATE TABLE t (x UInt8) ENGINE = MergeTree ORDER BY () COMMENT 'Hello';
ALTER TABLE t MODIFY COMMENT 'World', MODIFY COLUMN x UInt16;
DROP TABLE t SYNC;
CREATE TABLE t (x UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_comment_table2/t', '1') ORDER BY () COMMENT 'Hello';
CREATE TABLE t (x UInt8) ENGINE = MergeTree ORDER BY ();
CREATE TABLE t (x UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_comment_table3/t', '1') ORDER BY ();
CREATE TABLE t (x UInt8) ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_comment_table4/t', '1') ORDER BY ();
