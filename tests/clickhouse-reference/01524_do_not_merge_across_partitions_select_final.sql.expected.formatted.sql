SET allow_asynchronous_read_from_io_pool_for_merge_tree = 0;

SET do_not_merge_across_partitions_select_final = 1;

SET max_threads = 16;

CREATE TABLE select_final
(
    t DateTime,
    x Int32,
    string String
)
ENGINE = ReplacingMergeTree()
ORDER BY (x, t)
PARTITION BY toYYYYMM(t)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT *
FROM select_final FINAL
ORDER BY
    x ASC,
    t ASC;

SELECT max(x)
FROM select_final FINAL
WHERE string = 'updated';

SELECT max(x)
FROM select_final FINAL;