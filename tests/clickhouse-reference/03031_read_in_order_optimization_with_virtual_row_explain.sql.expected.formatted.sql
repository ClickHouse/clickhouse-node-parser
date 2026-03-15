-- Tags: no-random-merge-tree-settings, no-object-storage
SET optimize_read_in_order = 1, merge_tree_min_rows_for_concurrent_read = 1000, read_in_order_use_virtual_row = 1;

CREATE TABLE tab
(
    t DateTime
)
ENGINE = MergeTree
ORDER BY t
SETTINGS index_granularity = 1;