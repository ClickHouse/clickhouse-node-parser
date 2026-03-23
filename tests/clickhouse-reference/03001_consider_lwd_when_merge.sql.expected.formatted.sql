CREATE TABLE lwd_merge
(
    id UInt64 CODEC(NONE)
)
ENGINE = MergeTree
ORDER BY id
SETTINGS max_bytes_to_merge_at_min_space_in_pool = 80000, max_bytes_to_merge_at_max_space_in_pool = 80000, exclude_deleted_rows_for_part_size_in_merge = 0;

INSERT INTO lwd_merge SELECT number
FROM numbers(10000);

INSERT INTO lwd_merge SELECT number
FROM numbers(10000, 10000);

SET optimize_throw_if_noop = 1;

SELECT count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'lwd_merge'
    AND active = 1;