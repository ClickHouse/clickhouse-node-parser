SET check_query_single_value_result = 0;
CREATE TABLE check_codec(a Int, b Int CODEC(Delta, ZSTD)) ENGINE = MergeTree ORDER BY a SETTINGS min_bytes_for_wide_part = 0;
INSERT INTO check_codec SELECT number, number * 2 FROM numbers(1000);
CREATE TABLE check_codec(a Int, b Int CODEC(Delta, ZSTD)) ENGINE = MergeTree ORDER BY a SETTINGS min_bytes_for_wide_part = '10M';
