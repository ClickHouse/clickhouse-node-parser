CREATE TABLE max_parts_in_total
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY x
SETTINGS max_parts_in_total = 10;

SET max_insert_threads = 1;

SELECT 1;