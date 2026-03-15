-- Tags: no-random-mergetree-settings, no-random-settings
-- ^^ Prevent the data sizes from varying with random parameters.
-- This test validates the storage size of the text index without and with posting list compression.
SET enable_full_text_index = 1;

SET use_skip_indexes_on_data_read = 1;

SET use_query_condition_cache = 0;

SET max_insert_threads = 1;

SET max_block_size = 65536;

SET min_insert_block_size_rows = 0;

SET min_insert_block_size_bytes = 0;

CREATE TABLE tab_bitpacking
(
    ts DateTime CODEC(LZ4),
    str String CODEC(LZ4),
    INDEX inv_idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_codec = 'bitpacking')
)
ENGINE = MergeTree
ORDER BY ts
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = 0, enable_block_offset_column = 0, enable_block_number_column = 0, string_serialization_version = 'with_size_stream', primary_key_compress_block_size = 65536, marks_compress_block_size = 65536, min_compress_block_size = 65536, max_compress_block_size = 1048576, ratio_of_defaults_for_sparse_serialization = 0.95, serialization_info_version = 'basic', auto_statistics_types = 'minmax';

CREATE TABLE tab_uncompressed
(
    ts DateTime CODEC(LZ4),
    str String CODEC(LZ4),
    INDEX inv_idx str TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY ts
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = 0, enable_block_offset_column = 0, enable_block_number_column = 0, string_serialization_version = 'with_size_stream', primary_key_compress_block_size = 65536, marks_compress_block_size = 65536, min_compress_block_size = 65536, max_compress_block_size = 1048576, ratio_of_defaults_for_sparse_serialization = 0.95, serialization_info_version = 'basic', auto_statistics_types = 'minmax';

-- Compare the size of the text index for the same dataset with vs. without compression.
SELECT
    table,
    sum(`rows`),
    sum(secondary_indices_compressed_bytes)
FROM `system`.parts
WHERE database = currentDatabase()
    AND active
    AND table IN ('tab_bitpacking', 'tab_uncompressed')
GROUP BY table;