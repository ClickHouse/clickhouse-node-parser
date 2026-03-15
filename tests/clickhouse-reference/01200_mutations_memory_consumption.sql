-- Tags: no-debug, no-parallel, long, no-object-storage, no-random-settings, no-random-merge-tree-settings
SET optimize_trivial_insert_select = 1;
CREATE TABLE table_with_single_pk
(
  key UInt8,
  value String
)
ENGINE = MergeTree
ORDER BY key
SETTINGS min_compress_block_size=65536, max_compress_block_size=65536;
-- Memory usage for all mutations must be almost constant and less than
-- read_bytes
SELECT
  arrayDistinct(groupArray(if (read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
FROM
    system.part_log
WHERE event_type = 'MutatePart' AND table = 'table_with_single_pk' AND database = currentDatabase();
CREATE TABLE table_with_multi_pk
(
  key1 UInt8,
  key2 UInt32,
  key3 DateTime64(6, 'UTC'),
  value String
)
ENGINE = MergeTree
ORDER BY (key1, key2, key3)
SETTINGS min_compress_block_size=65536, max_compress_block_size=65536;
-- Memory usage for all mutations must be almost constant and less than
-- read_bytes
SELECT
  arrayDistinct(groupArray(if (read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
  FROM
      system.part_log
 WHERE event_type = 'MutatePart' AND table = 'table_with_multi_pk' AND database = currentDatabase();
CREATE TABLE table_with_function_pk
  (
    key1 UInt8,
    key2 UInt32,
    key3 DateTime64(6, 'UTC'),
    value String
  )
ENGINE = MergeTree
ORDER BY (cast(value as UInt64), key2)
SETTINGS min_compress_block_size=65536, max_compress_block_size=65536;
-- Memory usage for all mutations must be almost constant and less than
-- read_bytes
SELECT
  arrayDistinct(groupArray(if (read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
  FROM
      system.part_log
 WHERE event_type = 'MutatePart' AND table = 'table_with_function_pk' AND database = currentDatabase();
CREATE TABLE table_without_pk
(
  key1 UInt8,
  key2 UInt32,
  key3 DateTime64(6, 'UTC'),
  value String
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_compress_block_size=65536, max_compress_block_size=65536;
-- Memory usage for all mutations must be almost constant and less than
-- read_bytes
SELECT
  arrayDistinct(groupArray(if (read_bytes >= peak_memory_usage, [1], [read_bytes, peak_memory_usage])))
  FROM
      system.part_log
 WHERE event_type = 'MutatePart' AND table = 'table_without_pk' AND database = currentDatabase();
