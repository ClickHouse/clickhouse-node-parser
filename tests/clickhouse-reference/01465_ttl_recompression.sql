CREATE TABLE recompression_table
(
    dt DateTime,
    key UInt64,
    value String

) ENGINE MergeTree()
ORDER BY tuple()
PARTITION BY key
TTL dt + INTERVAL 1 MONTH RECOMPRESS CODEC(ZSTD(17)), dt + INTERVAL 1 YEAR RECOMPRESS CODEC(LZ4HC(10))
SETTINGS min_rows_for_wide_part = 0, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0;
SELECT COUNT() FROM recompression_table;
SELECT substring(name, 1, length(name) - 2), default_compression_codec FROM system.parts WHERE table = 'recompression_table' and active = 1 and database = currentDatabase() ORDER BY name;
SELECT substring(name, 1, length(name) - 4), default_compression_codec FROM system.parts WHERE table = 'recompression_table' and active = 1 and database = currentDatabase() ORDER BY name;
SELECT substring(name, 1, length(name) - 4), recompression_ttl_info.expression FROM system.parts WHERE table = 'recompression_table' and active = 1 and database = currentDatabase() ORDER BY name;
CREATE TABLE recompression_table_compact
(
  dt DateTime,
  key UInt64,
  value String

) ENGINE MergeTree()
ORDER BY tuple()
PARTITION BY key
TTL dt + INTERVAL 1 MONTH RECOMPRESS CODEC(ZSTD(17)), dt + INTERVAL 1 YEAR RECOMPRESS CODEC(LZ4HC(10))
SETTINGS min_rows_for_wide_part = 10000, min_bytes_for_full_part_storage = 0;
SELECT substring(name, 1, length(name) - 2), default_compression_codec FROM system.parts WHERE table = 'recompression_table_compact' and active = 1 and database = currentDatabase() ORDER BY name;
-- merge level and mutation in part name is not important
SELECT substring(name, 1, length(name) - 4), default_compression_codec FROM system.parts WHERE table = 'recompression_table_compact' and active = 1 and database = currentDatabase() ORDER BY name;
