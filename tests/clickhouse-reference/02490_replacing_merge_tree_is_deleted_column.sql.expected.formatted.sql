-- Tags: zookeeper
-- Settings allow_deprecated_syntax_for_merge_tree prevent to enable the is_deleted column
SET allow_deprecated_syntax_for_merge_tree = 0;

CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplacingMergeTree(version)
ORDER BY uid
SETTINGS allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM test FINAL
ORDER BY uid ASC;

SELECT *
FROM test
ORDER BY uid ASC;

CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplacingMergeTree(version)
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplacingMergeTree(version, is_deleted)
ORDER BY uid
SETTINGS allow_experimental_replacing_merge_with_cleanup = 1;

CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplacingMergeTree(version, is_deleted)
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

-- d6 has to be removed since we set clean_deleted_rows as 'Always'
SELECT *
FROM test
WHERE is_deleted = 0
ORDER BY uid ASC;

CREATE TABLE testCleanupR1
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_cleanup/', 'r1', version, is_deleted)
ORDER BY uid
SETTINGS allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testCleanupR1
ORDER BY uid ASC;

CREATE TABLE testSettingsR1
(
    col1 String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/test_setting/', 'r1', version, is_deleted)
ORDER BY col1
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testSettingsR1
WHERE is_deleted = 0
ORDER BY col1 ASC;

-- checkis_deleted type
CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted String
)
ENGINE = ReplacingMergeTree(version, is_deleted)
ORDER BY uid; -- { serverError BAD_TYPE_OF_FIELD }

CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplacingMergeTree(version, is_deleted)
ORDER BY uid;

SELECT
    'no cleanup 1',
    *
FROM test FINAL
ORDER BY uid ASC;

SELECT
    'no cleanup 2',
    *
FROM test
ORDER BY uid ASC;

CREATE TABLE test
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/{database}/tables/no_cleanup/', 'r1', version, is_deleted)
ORDER BY uid;

SELECT
    'no cleanup 3',
    *
FROM test FINAL
ORDER BY uid ASC;

SELECT
    'no cleanup 4',
    *
FROM test
ORDER BY uid ASC;

CREATE TABLE testMT
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = MergeTree()
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testMT
ORDER BY uid ASC;

CREATE TABLE testSummingMT
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = SummingMergeTree()
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testSummingMT
ORDER BY uid ASC;

CREATE TABLE testAggregatingMT
(
    uid String,
    version UInt32,
    is_deleted UInt8
)
ENGINE = AggregatingMergeTree()
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testAggregatingMT
ORDER BY uid ASC;

CREATE TABLE testCollapsingMT
(
    uid String,
    version UInt32,
    is_deleted UInt8,
    sign Int8
)
ENGINE = CollapsingMergeTree(sign)
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testCollapsingMT
ORDER BY uid ASC;

CREATE TABLE testVersionedCMT
(
    uid String,
    version UInt32,
    is_deleted UInt8,
    sign Int8
)
ENGINE = VersionedCollapsingMergeTree(sign, version)
ORDER BY uid
SETTINGS clean_deleted_rows = 'Always', allow_experimental_replacing_merge_with_cleanup = 1;

SELECT *
FROM testVersionedCMT
ORDER BY uid ASC;