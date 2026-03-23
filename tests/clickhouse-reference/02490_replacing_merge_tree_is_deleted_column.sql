-- Tags: zookeeper

-- Settings allow_deprecated_syntax_for_merge_tree prevent to enable the is_deleted column
set allow_deprecated_syntax_for_merge_tree=0;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version) Order by (uid) settings allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO test (*) VALUES ('d1', 1, 0), ('d2', 1, 0), ('d6', 1, 0), ('d4', 1, 0), ('d6', 2, 1), ('d3', 1, 0), ('d1', 2, 1), ('d5', 1, 0), ('d4', 2, 1), ('d1', 3, 0), ('d1', 4, 1), ('d4', 3, 0), ('d1', 5, 0);
select * from test FINAL order by uid;
select * from test order by uid;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid) settings allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO test (*) VALUES ('d6', 1, 0), ('d4', 1, 0), ('d6', 2, 1), ('d3', 1, 0), ('d1', 2, 1), ('d5', 1, 0), ('d4', 2, 1);
INSERT INTO test (*) VALUES ('d4', 1, 0), ('d6', 2, 1), ('d3', 1, 0), ('d1', 2, 1), ('d5', 1, 0), ('d4', 2, 1), ('d1', 3, 1), ('d1', 4, 1), ('d4', 3, 0), ('d1', 5, 0), ('d2', 2, 1), ('d2', 3, 0), ('d3', 2, 1), ('d3', 3, 0);
-- Expect d6 to be version=3 is_deleted=false
INSERT INTO test (*) VALUES ('d1', 1, 0), ('d1', 2, 1), ('d1', 3, 0), ('d1', 4, 1), ('d1', 5, 0), ('d2', 1, 0), ('d3', 1, 0), ('d4', 1, 0),  ('d5', 1, 0), ('d6', 1, 0), ('d6', 3, 0);
-- Insert previous version of 'd6' but only v=3 is_deleted=false will remain
INSERT INTO test (*) VALUES ('d1', 1, 0), ('d1', 2, 1), ('d1', 3, 0), ('d1', 4, 1), ('d1', 5, 0), ('d2', 1, 0), ('d3', 1, 0), ('d4', 1, 0),  ('d5', 1, 0), ('d6', 1, 0), ('d6', 2, 1);
-- insert d6 v=3 is_deleted=true (timestamp more recent so this version should be the one take into acount)
INSERT INTO test (*) VALUES ('d1', 1, 0), ('d1', 2, 1), ('d1', 3, 0), ('d1', 4, 1), ('d1', 5, 0), ('d2', 1, 0), ('d3', 1, 0), ('d4', 1, 0),  ('d5', 1, 0), ('d6', 1, 0), ('d6', 3, 1);
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
-- d6 has to be removed since we set clean_deleted_rows as 'Always'
select * from test where is_deleted=0 order by uid;
CREATE TABLE testCleanupR1 (uid String, version UInt32, is_deleted UInt8)
    ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_cleanup/', 'r1', version, is_deleted)
    ORDER BY uid settings allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testCleanupR1 (*) VALUES ('d1', 1, 0),('d2', 1, 0),('d3', 1, 0),('d4', 1, 0);
INSERT INTO testCleanupR1 (*) VALUES ('d3', 2, 1);
INSERT INTO testCleanupR1 (*) VALUES ('d1', 2, 1);
SELECT * FROM testCleanupR1 order by uid;
CREATE TABLE testSettingsR1 (col1 String, version UInt32, is_deleted UInt8)
    ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_setting/', 'r1', version, is_deleted)
    ORDER BY col1
    SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testSettingsR1 (*) VALUES ('c1', 1, 1),('c2', 1, 0),('c3', 1, 1),('c4', 1, 0);
SELECT * FROM testSettingsR1 where is_deleted=0 order by col1;
-- is_deleted == 0/1
INSERT INTO test (*) VALUES ('d1', 1, 2); -- { serverError INCORRECT_DATA }
-- checkis_deleted type
CREATE TABLE test (uid String, version UInt32, is_deleted String) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid); -- { serverError BAD_TYPE_OF_FIELD }
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid);
select 'no cleanup 1', * from test FINAL order by uid;
select 'no cleanup 2', * from test order by uid;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/no_cleanup/', 'r1', version, is_deleted) Order by (uid);
select 'no cleanup 3', * from test FINAL order by uid;
select 'no cleanup 4', * from test order by uid;
CREATE TABLE testMT (uid String, version UInt32, is_deleted UInt8) ENGINE = MergeTree() Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testMT (*) VALUES ('d1', 1, 1);
SELECT * FROM testMT order by uid;
CREATE TABLE testSummingMT (uid String, version UInt32, is_deleted UInt8) ENGINE = SummingMergeTree() Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testSummingMT (*) VALUES ('d1', 1, 1);
SELECT * FROM testSummingMT order by uid;
CREATE TABLE testAggregatingMT (uid String, version UInt32, is_deleted UInt8) ENGINE = AggregatingMergeTree() Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testAggregatingMT (*) VALUES ('d1', 1, 1);
SELECT * FROM testAggregatingMT order by uid;
CREATE TABLE testCollapsingMT (uid String, version UInt32, is_deleted UInt8, sign Int8) ENGINE = CollapsingMergeTree(sign) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testCollapsingMT (*) VALUES ('d1', 1, 1, 1);
SELECT * FROM testCollapsingMT order by uid;
CREATE TABLE testVersionedCMT (uid String, version UInt32, is_deleted UInt8, sign Int8) ENGINE = VersionedCollapsingMergeTree(sign, version) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
INSERT INTO testVersionedCMT (*) VALUES ('d1', 1, 1, 1);
SELECT * FROM testVersionedCMT order by uid;
