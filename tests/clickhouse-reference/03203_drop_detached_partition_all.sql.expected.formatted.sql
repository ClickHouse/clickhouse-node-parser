CREATE TABLE t_03203
(
    p UInt64,
    v UInt64
)
ENGINE = MergeTree
ORDER BY v
PARTITION BY p;

SELECT *
FROM t_03203
ORDER BY
    p ASC,
    v ASC;

SELECT count()
FROM `system`.detached_parts
WHERE database = currentDatabase()
    AND table = 't_03203';