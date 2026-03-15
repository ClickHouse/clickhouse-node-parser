-- Tags: zookeeper

-- Settings allow_deprecated_syntax_for_merge_tree prevent to enable the is_deleted column
set allow_deprecated_syntax_for_merge_tree=0;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version) Order by (uid) settings allow_experimental_replacing_merge_with_cleanup=1;
select * from test FINAL order by uid;
select * from test order by uid;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid) settings allow_experimental_replacing_merge_with_cleanup=1;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
-- d6 has to be removed since we set clean_deleted_rows as 'Always'
select * from test where is_deleted=0 order by uid;
CREATE TABLE testCleanupR1 (uid String, version UInt32, is_deleted UInt8)
    ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_cleanup/', 'r1', version, is_deleted)
    ORDER BY uid settings allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testCleanupR1 order by uid;
CREATE TABLE testSettingsR1 (col1 String, version UInt32, is_deleted UInt8)
    ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_setting/', 'r1', version, is_deleted)
    ORDER BY col1
    SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testSettingsR1 where is_deleted=0 order by col1;
-- checkis_deleted type
CREATE TABLE test (uid String, version UInt32, is_deleted String) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid); -- { serverError BAD_TYPE_OF_FIELD }
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplacingMergeTree(version, is_deleted) Order by (uid);
select 'no cleanup 1', * from test FINAL order by uid;
select 'no cleanup 2', * from test order by uid;
CREATE TABLE test (uid String, version UInt32, is_deleted UInt8) ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/no_cleanup/', 'r1', version, is_deleted) Order by (uid);
select 'no cleanup 3', * from test FINAL order by uid;
select 'no cleanup 4', * from test order by uid;
CREATE TABLE testMT (uid String, version UInt32, is_deleted UInt8) ENGINE = MergeTree() Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testMT order by uid;
CREATE TABLE testSummingMT (uid String, version UInt32, is_deleted UInt8) ENGINE = SummingMergeTree() Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testSummingMT order by uid;
CREATE TABLE testAggregatingMT (uid String, version UInt32, is_deleted UInt8) ENGINE = AggregatingMergeTree() Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testAggregatingMT order by uid;
CREATE TABLE testCollapsingMT (uid String, version UInt32, is_deleted UInt8, sign Int8) ENGINE = CollapsingMergeTree(sign) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testCollapsingMT order by uid;
CREATE TABLE testVersionedCMT (uid String, version UInt32, is_deleted UInt8, sign Int8) ENGINE = VersionedCollapsingMergeTree(sign, version) Order by (uid) SETTINGS clean_deleted_rows='Always', allow_experimental_replacing_merge_with_cleanup=1;
SELECT * FROM testVersionedCMT order by uid;
