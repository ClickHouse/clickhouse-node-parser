-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS column_modify_test;

SET use_statistics = 1;

CREATE TABLE column_modify_test
(
    id UInt64,
    val String,
    other_col UInt64
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, auto_statistics_types = 'uniq,countmin';

INSERT INTO column_modify_test;

SELECT
    *,
    throwIf(val <> 'one') AS issue
FROM column_modify_test
WHERE id = 1
FORMAT NULL;

SYSTEM DROP  TABLE column_modify_test;

CREATE TABLE column_modify_test
(
    id UInt64,
    val Nullable(String),
    other_col UInt64
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, auto_statistics_types = 'uniq,countmin';