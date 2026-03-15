-- Tags: no-random-merge-tree-settings
-- add_minmax_index_for_numeric_columns=0: Different part size on disk
SET send_logs_level = 'fatal';

SET joined_subquery_requires_alias = 0;

CREATE TABLE delta_codec_synthetic
(
    id UInt64 CODEC(Delta, ZSTD(3))
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, serialization_info_version = 'basic', auto_statistics_types = '', add_minmax_index_for_numeric_columns = 0;

CREATE TABLE default_codec_synthetic
(
    id UInt64 CODEC(ZSTD(3))
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns = 0;

SET max_insert_threads = 1;

SELECT floor(big_size / small_size) AS ratio
FROM
    (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS small_size
        FROM `system`.parts
        WHERE database == currentDatabase()
            AND table == 'delta_codec_synthetic'
            AND active
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS big_size
        FROM `system`.parts
        WHERE database == currentDatabase()
            AND table == 'default_codec_synthetic'
            AND active
    )
    USING (key);

SELECT small_hash == big_hash
FROM
    (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS small_hash
        FROM delta_codec_synthetic
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS big_hash
        FROM default_codec_synthetic
    )
    USING (key);

CREATE TABLE delta_codec_float
(
    id Float64 CODEC(Delta, LZ4HC)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns = 0;

CREATE TABLE default_codec_float
(
    id Float64 CODEC(LZ4HC)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns = 0;

SELECT floor(big_size / small_size) AS ratio
FROM
    (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS small_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'delta_codec_float'
            AND active
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS big_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'default_codec_float'
            AND active
    )
    USING (key);

SELECT small_hash == big_hash
FROM
    (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS small_hash
        FROM delta_codec_float
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS big_hash
        FROM default_codec_float
    )
    USING (key);

CREATE TABLE delta_codec_string
(
    id Float64 CODEC(Delta, LZ4)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns = 0;

CREATE TABLE default_codec_string
(
    id Float64 CODEC(LZ4)
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns = 0;

SELECT floor(big_size / small_size) AS ratio
FROM
    (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS small_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'delta_codec_string'
            AND active
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(bytes_on_disk) AS big_size
        FROM `system`.parts
        WHERE database = currentDatabase()
            AND table = 'default_codec_string'
            AND active
    )
    USING (key);

SELECT small_hash == big_hash
FROM
    (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS small_hash
        FROM delta_codec_string
    )
INNER JOIN (
        SELECT
            1 AS key,
            sum(cityHash64(*)) AS big_hash
        FROM default_codec_string
    )
    USING (key);