-- Tests the behavior of MergeTree setting 'alter_column_secondary_index_mode' with tables in compact and wide format
-- for ALTER TABLE {} DELETE and ALTER TABLE {} UPDATE
SET apply_mutations_on_fly = 0;

SET mutations_sync = 1;

SET alter_sync = 1;

DROP TABLE IF EXISTS test_compact;

DROP TABLE IF EXISTS test_wide;

CREATE TABLE test_compact
(
    a Int32,
    b Int32,
    c Int32,
    INDEX idx_minmax b TYPE minmax
)
ENGINE = MergeTree
ORDER BY a
SETTINGS min_bytes_for_wide_part = 999999999;

CREATE TABLE test_wide
(
    a Int32,
    b Int32,
    c Int32,
    INDEX idx_minmax b TYPE minmax
)
ENGINE = MergeTree
ORDER BY a
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO test_compact;

INSERT INTO test_wide;

INSERT INTO test_compact;

INSERT INTO test_wide;

SELECT
    'COMPACT BEFORE',
    *
FROM test_compact;

SELECT
    'WIDE BEFORE',
    *
FROM test_wide;

SELECT
    'COMPACT AFTER UPDATE',
    *
FROM test_compact;

SELECT
    'WIDE AFTER UPDATE',
    *
FROM test_wide;

SELECT
    table,
    name,
    concat('Emtpy : ', if(marks_bytes == 0, 'true', 'false'))
FROM `system`.data_skipping_indices
WHERE table = 'test_compact'
    AND database = currentDatabase()
    AND name = 'idx_minmax';

SELECT
    table,
    name,
    concat('Emtpy : ', if(marks_bytes == 0, 'true', 'false'))
FROM `system`.data_skipping_indices
WHERE table = 'test_wide'
    AND database = currentDatabase()
    AND name = 'idx_minmax';

SELECT
    'COMPACT AFTER DELETE',
    *
FROM test_compact;

SELECT
    'WIDE AFTER DELETE',
    *
FROM test_wide;