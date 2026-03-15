SET mutations_sync = 2;
CREATE TABLE tbl1
(
    key Int,
    x Int,
    y Int,
    INDEX x_idx x TYPE minmax GRANULARITY 1
)
ENGINE=MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = true,
         add_minmax_index_for_string_columns = true,
         add_minmax_index_for_temporal_columns = true,
         index_granularity = 8192,
         index_granularity_bytes = 10485760;
-- Expect x_idx and two implicit minmax indices
SELECT name, type, expr, data_compressed_bytes FROM system.data_skipping_indices WHERE table = 'tbl1' AND database = currentDatabase();
-- Check that users cannot create explicit minmax indices with the names of internal minmax indices

CREATE TABLE tbl2
(
    key Int,
    x Int,
    y Int,
    INDEX auto_minmax_index_x x TYPE minmax
)
ENGINE=MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = true; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tbl2
(
    key Int,
    x Int,
    y Int,
    INDEX auto_minmax_index_x x TYPE minmax -- fine, add_minmax_index_for_numeric_columns isn't set
)
ENGINE=MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns=0;
CREATE TABLE tbl3
(
    key Int,
    x Int,
    y Int
)
ENGINE=MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns=0;
CREATE TABLE tbl4
(
    key Int,
    x Int,
    y Int
)
ENGINE=MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_string_columns = true;
CREATE TABLE tbl5
(
    key Int,
    x Int,
    y Int
)
ENGINE=MergeTree()
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
ENGINE=MergeTree()
ORDER BY key
SETTINGS add_minmax_index_for_numeric_columns = FALSE,
         add_minmax_index_for_string_columns = FALSE,
         add_minmax_index_for_temporal_columns = FALSE;
SELECT name,type,expr,data_compressed_bytes FROM system.data_skipping_indices WHERE table = 'tbl6' AND database = currentDatabase();
