-- Tags: no-msan, long, no-azure-blob-storage
-- msan: too slow

SELECT '-- Single partition by function';
CREATE TABLE 03173_single_function (
    dt Date,
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toMonth(dt);
SELECT count() FROM 03173_single_function WHERE dt IN ('2024-01-20', '2024-05-25') SETTINGS log_comment='03173_single_function';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_single_function';
CREATE TABLE 03173_nested_function(
    id Int32,
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3;
SELECT count() FROM 03173_nested_function WHERE id IN (10) SETTINGS log_comment='03173_nested_function';
SELECT count() FROM 03173_nested_function WHERE xxHash32(id) IN (2158931063, 1449383981) SETTINGS log_comment='03173_nested_function_subexpr';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_subexpr';
SET allow_suspicious_low_cardinality_types = 1;
CREATE TABLE 03173_nested_function_lc(
    id LowCardinality(Int32),
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3;
SELECT count() FROM 03173_nested_function_lc WHERE id IN (10) SETTINGS log_comment='03173_nested_function_lc';
SELECT count() FROM 03173_nested_function_lc WHERE xxHash32(id) IN (2158931063, 1449383981) SETTINGS log_comment='03173_nested_function_subexpr_lc';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_lc';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_subexpr_lc';
CREATE TABLE 03173_nested_function_null(
    id Nullable(Int32),
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3
SETTINGS allow_nullable_key=1;
SELECT count() FROM 03173_nested_function_null WHERE id IN (10) SETTINGS log_comment='03173_nested_function_null';
SELECT count() FROM 03173_nested_function_null WHERE xxHash32(id) IN (2158931063, 1449383981) SETTINGS log_comment='03173_nested_function_subexpr_null';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_null';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_subexpr_null';
CREATE TABLE 03173_nested_function_lc_null(
    id LowCardinality(Nullable(Int32)),
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3
SETTINGS allow_nullable_key=1;
SELECT count() FROM 03173_nested_function_lc_null WHERE id IN (10) SETTINGS log_comment='03173_nested_function_lc_null';
SELECT count() FROM 03173_nested_function_lc_null WHERE xxHash32(id) IN (2158931063, 1449383981) SETTINGS log_comment='03173_nested_function_subexpr_lc_null';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_lc_null';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_function_subexpr_lc_null';
CREATE TABLE 03173_nonsafe_cast(
    id Int64,
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3;
SELECT count() FROM 03173_nonsafe_cast WHERE id IN (SELECT '50' UNION ALL SELECT '99') SETTINGS log_comment='03173_nonsafe_cast';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nonsafe_cast';
CREATE TABLE 03173_multiple_partition_cols (
    key1 Int32,
    key2 Int32
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY (intDiv(key1, 50), xxHash32(key2) % 3);
SELECT count() FROM 03173_multiple_partition_cols WHERE key2 IN (4) SETTINGS log_comment='03173_multiple_columns';
SELECT count() FROM 03173_multiple_partition_cols WHERE xxHash32(key2) IN (4251411170) SETTINGS log_comment='03173_multiple_columns_subexpr';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_multiple_columns';
-- Due to xxHash32() in WHERE condition, MinMax is unable to eliminate any parts,
-- so partition pruning leave two parts (for key1 // 50 = 0 and key1 // 50 = 1)
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_multiple_columns_subexpr';
CREATE TABLE 03173_base_data_source(
    id Int32,
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3;
CREATE TABLE 03173_low_cardinality_set (id LowCardinality(Int32)) ENGINE=Memory AS SELECT 10;
SELECT count() FROM 03173_base_data_source WHERE id IN (SELECT id FROM 03173_low_cardinality_set) SETTINGS log_comment='03173_low_cardinality_set';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_low_cardinality_set';
CREATE TABLE 03173_nullable_set (id Nullable(Int32)) ENGINE=Memory AS SELECT 10;
SELECT count() FROM 03173_base_data_source WHERE id IN (SELECT id FROM 03173_nullable_set) SETTINGS log_comment='03173_nullable_set';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nullable_set';
CREATE TABLE 03173_lc_nullable_set (id LowCardinality(Nullable(Int32))) ENGINE=Memory AS SELECT 10 UNION ALL SELECT NULL;
SELECT count() FROM 03173_base_data_source WHERE id IN (SELECT id FROM 03173_lc_nullable_set) SETTINGS log_comment='03173_lc_nullable_set';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_lc_nullable_set';
CREATE TABLE 03173_date_parsing (
    id String
)
ENGINE=MergeTree
ORDER BY tuple()
PARTITION BY toDate(id);
SELECT count() FROM 03173_date_parsing WHERE id IN ('2023-04-02', '2023-05-02');
SELECT count() FROM 03173_date_parsing WHERE id IN ('not a date');
CREATE TABLE 03173_nested_date_parsing (
    id String
)
ENGINE=MergeTree
ORDER BY tuple()
PARTITION BY toMonth(toDate(id));
SELECT count() FROM 03173_nested_date_parsing WHERE id IN ('2000-01-21', '2023-05-02') SETTINGS log_comment='03173_nested_date_parsing', session_timezone = '';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_nested_date_parsing';
SELECT count() FROM 03173_nested_date_parsing WHERE id IN ('not a date');
CREATE TABLE 03173_empty_transform(
    id Int32,
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY xxHash32(id) % 3;
SELECT id FROM 03173_empty_transform WHERE xxHash32(id) % 3 IN (xxHash32(2::Int32) % 3) SETTINGS log_comment='03173_empty_transform';
SELECT ProfileEvents['SelectedParts'] FROM system.query_log WHERE type = 'QueryFinish' AND current_database = currentDatabase() AND log_comment = '03173_empty_transform';
