CREATE TABLE t
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY (a, b)
SETTINGS index_granularity = 1;

SET merge_tree_min_bytes_for_concurrent_read = 1, merge_tree_min_rows_for_concurrent_read = 1, merge_tree_read_split_ranges_into_intersecting_and_non_intersecting_injection_probability = 1.0, max_threads = 4;

-- the bug happened when we used (a, b) index values for one part and only (a) for another in PartsSplitter. even a simple count query is enough,
-- because some granules were assinged to wrong layers and hence not returned from the reading step (because they were filtered out by `FilterSortedStreamByRange`)
SELECT count()
FROM t
WHERE NOT ignore(*);