CREATE TABLE partitions
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY x;

SELECT count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'partitions';

SET max_partitions_per_insert_block = 1;