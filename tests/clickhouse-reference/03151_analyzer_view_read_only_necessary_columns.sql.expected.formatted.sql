SYSTEM DROP  TABLE IF EXISTS test_table;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

SYSTEM DROP  VIEW IF EXISTS test_view;

CREATE VIEW test_view
AS
SELECT
    id,
    value
FROM test_table;

SYSTEM DROP  VIEW test_view;

SYSTEM DROP  TABLE test_table;