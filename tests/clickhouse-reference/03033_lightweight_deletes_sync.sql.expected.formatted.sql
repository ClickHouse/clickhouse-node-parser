CREATE TABLE t_lightweight_deletes
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY a;

SELECT count()
FROM t_lightweight_deletes;

SELECT count()
FROM `system`.mutations
WHERE database = currentDatabase()
    AND table = 't_lightweight_deletes'
    AND NOT is_done;