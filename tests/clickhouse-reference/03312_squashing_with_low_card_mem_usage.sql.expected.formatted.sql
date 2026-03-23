-- Tags: no-tsan, no-asan, no-msan, no-ubsan, no-random-settings, no-random-merge-tree-settings
-- no sanitizers -- memory consumption is unpredicatable with sanitizers
-- no random settings -- it was quite hard to reproduce and I'm afraid that settings randomisation will make the test weaker
SYSTEM drop  table if exists t;

CREATE TABLE t
(
    s LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0;

-- The problem was that we didn't account for dictionary size in `ColumnLowCardinality::byteSize()`.
-- Because of that we tend to accumulate too many blocks in `SimpleSquashingChunksTransform`.
-- To reproduce we need a column with heavy dictionaries and ideally nothing else consuming significant amount of memory.
INSERT INTO t SELECT concat(repeat('x', 1000), toString(number)) AS s
FROM numbers_mt(5e6)
SETTINGS
    max_insert_threads = 16,
    max_memory_usage = '15Gi';