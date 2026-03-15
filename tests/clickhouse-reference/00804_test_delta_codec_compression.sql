-- Tags: no-random-merge-tree-settings
-- add_minmax_index_for_numeric_columns=0: Different part size on disk

SET send_logs_level = 'fatal';
SET joined_subquery_requires_alias = 0;
CREATE TABLE delta_codec_synthetic
(
    id UInt64 Codec(Delta, ZSTD(3))
) ENGINE MergeTree() ORDER BY tuple() SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, serialization_info_version = 'basic', auto_statistics_types = '', add_minmax_index_for_numeric_columns=0;
CREATE TABLE default_codec_synthetic
(
    id UInt64 Codec(ZSTD(3))
) ENGINE MergeTree() ORDER BY tuple() SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns=0;
set max_insert_threads = 1;
SELECT
    floor(big_size / small_size) AS ratio
FROM
    (SELECT 1 AS key, sum(bytes_on_disk) AS small_size FROM system.parts WHERE database == currentDatabase() and table == 'delta_codec_synthetic' and active)
INNER JOIN
    (SELECT 1 AS key, sum(bytes_on_disk) as big_size FROM system.parts WHERE database == currentDatabase() and table == 'default_codec_synthetic' and active)
USING(key);
SELECT
    small_hash == big_hash
FROM
    (SELECT 1 AS key, sum(cityHash64(*)) AS small_hash FROM delta_codec_synthetic)
INNER JOIN
    (SELECT 1 AS key, sum(cityHash64(*)) AS big_hash FROM default_codec_synthetic)
USING(key);
CREATE TABLE delta_codec_float
(
    id Float64 Codec(Delta, LZ4HC)
) ENGINE MergeTree() ORDER BY tuple() SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns=0;
CREATE TABLE default_codec_float
(
    id Float64 Codec(LZ4HC)
) ENGINE MergeTree() ORDER BY tuple() SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns=0;
SELECT
    floor(big_size / small_size) as ratio
FROM
    (SELECT 1 AS key, sum(bytes_on_disk) AS small_size FROM system.parts WHERE database = currentDatabase() and table = 'delta_codec_float' and active)
INNER JOIN
    (SELECT 1 AS key, sum(bytes_on_disk) as big_size FROM system.parts WHERE database = currentDatabase() and table = 'default_codec_float' and active) USING(key);
SELECT
    small_hash == big_hash
FROM
    (SELECT 1 AS key, sum(cityHash64(*)) AS small_hash FROM delta_codec_float)
INNER JOIN
    (SELECT 1 AS key, sum(cityHash64(*)) AS big_hash FROM default_codec_float)
USING(key);
CREATE TABLE delta_codec_string
(
    id Float64 Codec(Delta, LZ4)
) ENGINE MergeTree() ORDER BY tuple() SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns=0;
CREATE TABLE default_codec_string
(
    id Float64 Codec(LZ4)
) ENGINE MergeTree() ORDER BY tuple() SETTINGS min_bytes_for_wide_part = 0, compress_marks = false, compress_primary_key = false, ratio_of_defaults_for_sparse_serialization = 1, enable_block_number_column = 0, auto_statistics_types = '', add_minmax_index_for_numeric_columns=0;
SELECT
    floor(big_size / small_size) as ratio
FROM
    (SELECT 1 AS key, sum(bytes_on_disk) AS small_size FROM system.parts WHERE database = currentDatabase() and table = 'delta_codec_string' and active)
INNER JOIN
    (SELECT 1 AS key, sum(bytes_on_disk) as big_size FROM system.parts WHERE database = currentDatabase() and table = 'default_codec_string' and active) USING(key);
SELECT
    small_hash == big_hash
FROM
    (SELECT 1 AS key, sum(cityHash64(*)) AS small_hash FROM delta_codec_string)
INNER JOIN
    (SELECT 1 AS key, sum(cityHash64(*)) AS big_hash FROM default_codec_string)
USING(key);
