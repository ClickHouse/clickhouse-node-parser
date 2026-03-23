SYSTEM DROP  TABLE IF EXISTS test_apply_deleted_mask;

CREATE TABLE test_apply_deleted_mask
(
    id Int64,
    value String
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO test_apply_deleted_mask SELECT
    number,
    number::String
FROM numbers(5);

SELECT
    *,
    _row_exists
FROM test_apply_deleted_mask;

SELECT
    *,
    _row_exists
FROM test_apply_deleted_mask
SETTINGS apply_deleted_mask = 0;

SELECT *
FROM test_apply_deleted_mask
WHERE _row_exists
SETTINGS apply_deleted_mask = 0;

INSERT INTO test_apply_deleted_mask SELECT
    number,
    number::String
FROM numbers(5, 1);

SYSTEM DROP  TABLE test_apply_deleted_mask;