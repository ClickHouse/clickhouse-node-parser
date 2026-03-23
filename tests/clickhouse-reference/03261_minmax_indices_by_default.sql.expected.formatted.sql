SET mutations_sync = 2;

DROP TABLE IF EXISTS tbl1;

DROP TABLE IF EXISTS tbl2;

DROP TABLE IF EXISTS tbl3;

DROP TABLE IF EXISTS tbl4;

DROP TABLE IF EXISTS tbl5;

CREATE TABLE tbl1
(
    key Int,
    x Int,
    y Int,
    INDEX x_idx x TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = true, add_minmax_index_for_string_columns = true, add_minmax_index_for_temporal_columns = true, index_granularity = 8192, index_granularity_bytes = 10485760;

INSERT INTO tbl1;

-- Expect x_idx and two implicit minmax indices
SELECT
    name,
    type,
    expr,
    data_compressed_bytes
FROM `system`.data_skipping_indices
WHERE table = 'tbl1'
    AND database = currentDatabase();

-- Check that users cannot create explicit minmax indices with the names of internal minmax indices
CREATE TABLE tbl2
(
    key Int,
    x Int,
    y Int,
    INDEX auto_minmax_index_x x TYPE minmax
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = true; -- { serverError BAD_ARGUMENTS }

CREATE TABLE tbl2
(
    key Int,
    x Int,
    y Int,
    INDEX auto_minmax_index_x x TYPE minmax
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE tbl3
(
    key Int,
    x Int,
    y Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = 0;

CREATE TABLE tbl4
(
    key Int,
    x Int,
    y Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_string_columns = true;

CREATE TABLE tbl5
(
    key Int,
    x Int,
    y Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_temporal_columns = true;

CREATE TABLE tbl6
(
    key Int,
    x Int,
    y Int,
    s String,
    INDEX x_idx x TYPE minmax
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = false, add_minmax_index_for_string_columns = false, add_minmax_index_for_temporal_columns = false;

SELECT
    name,
    type,
    expr,
    data_compressed_bytes
FROM `system`.data_skipping_indices
WHERE table = 'tbl6'
    AND database = currentDatabase();

DROP TABLE tbl1;

DROP TABLE tbl2;

DROP TABLE tbl3;

DROP TABLE tbl4;

DROP TABLE tbl5;

DROP TABLE tbl6;