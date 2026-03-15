-- Tags: no-fasttest, no-parallel
SET engine_file_truncate_on_insert = 1;

SET output_format_parquet_use_custom_encoder = 1;

SET output_format_parquet_row_group_size = 100;

SET input_format_parquet_filter_push_down = 0;

SET input_format_parquet_page_filter_push_down = 0;

SET input_format_parquet_bloom_filter_push_down = 1;

SET schema_inference_make_columns_nullable = 'auto';

SET enable_analyzer = 1; -- required for multiple array joins

SET max_block_size = 1000000; -- have only one block to make sure rows are split into row groups deterministically

SET preferred_block_size_bytes = 1000000000000;

CREATE TABLE data
(
    n UInt64,
    s String,
    l UInt256,
    d Decimal128(4),
    lc LowCardinality(String)
)
ENGINE = Memory;

SELECT
    'no bf: metadata',
    rg.num_rows,
    col.name,
    col.bloom_filter_bytes
FROM
    file(bf_03263.parquet, ParquetMetadata)
ARRAY JOIN row_groups AS rg
ARRAY JOIN rg.`columns` AS col
ORDER BY
    rg.file_offset ASC,
    col.name ASC;

SELECT
    'no bf: UInt64 hit',
    count(),
    sum(n = 12300 AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'no bf: UInt64 miss',
    count(),
    sum(n = 12345 AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: metadata',
    rg.num_rows,
    col.name,
    col.bloom_filter_bytes
FROM
    file(bf_03263.parquet, ParquetMetadata)
ARRAY JOIN row_groups AS rg
ARRAY JOIN rg.`columns` AS col
ORDER BY
    rg.file_offset ASC,
    col.name ASC;

SELECT
    'bf: UInt64 hit',
    count(),
    sum(n = 12300 AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: UInt64 miss',
    count(),
    sum(n = 12345 AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: String hit',
    count(),
    sum(s = '1230' AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: String miss',
    count(),
    sum(s = '1234' AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: UInt256 hit',
    count(),
    sum(l = 7890000000000000000000000000000000000000000::UInt256 AS cond)
FROM file(bf_03263.parquet, Parquet, 'l UInt256')
WHERE indexHint(cond);

SELECT
    'bf: UInt256 miss',
    count(),
    sum(l = 7890000000000000000000000000000000000000001::UInt256 AS cond)
FROM file(bf_03263.parquet, Parquet, 'l UInt256')
WHERE indexHint(cond);

SELECT
    'bf: Decimal128(4) hit',
    count(),
    sum(d = 108147.456::Decimal128(4) AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: Decimal128(4) miss',
    count(),
    sum(d = 108147.4567::Decimal128(4) AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: LowCardinality(String) hit',
    count(),
    sum(lc = 'lc4' AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'bf: LowCardinality(String) miss',
    count(),
    sum(lc = 'lc1' AS cond)
FROM file(bf_03263.parquet)
WHERE indexHint(cond);

SELECT
    'more bits per value: metadata',
    rg.num_rows,
    col.name,
    col.bloom_filter_bytes
FROM
    file(bf_03263.parquet, ParquetMetadata)
ARRAY JOIN row_groups AS rg
ARRAY JOIN rg.`columns` AS col
ORDER BY
    rg.file_offset ASC,
    col.name ASC;