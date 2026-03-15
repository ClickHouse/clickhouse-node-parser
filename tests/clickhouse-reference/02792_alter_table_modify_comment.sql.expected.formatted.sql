SELECT comment
FROM `system`.tables
WHERE database = currentDatabase()
    AND table = 't';

CREATE TABLE t
(
    x UInt8
)
ENGINE = MergeTree
ORDER BY tuple()
COMMENT 'Hello';

CREATE TABLE t
(
    x UInt8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_comment_table2/t', '1')
ORDER BY tuple()
COMMENT 'Hello';

CREATE TABLE t
(
    x UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE t
(
    x UInt8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_comment_table3/t', '1')
ORDER BY tuple();

CREATE TABLE t
(
    x UInt8
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_comment_table4/t', '1')
ORDER BY tuple();