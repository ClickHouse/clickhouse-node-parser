SET check_query_single_value_result = 0;
CREATE TABLE check_codec(a Int, b Int CODEC(Delta, ZSTD)) ENGINE = MergeTree ORDER BY a SETTINGS min_bytes_for_wide_part = 0;
CREATE TABLE check_codec(a Int, b Int CODEC(Delta, ZSTD)) ENGINE = MergeTree ORDER BY a SETTINGS min_bytes_for_wide_part = '10M';
