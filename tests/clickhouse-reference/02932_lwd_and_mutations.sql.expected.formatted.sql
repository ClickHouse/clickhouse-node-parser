DROP TABLE IF EXISTS t_lwd_mutations;

CREATE TABLE t_lwd_mutations
(
    id UInt64,
    v UInt64
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO t_lwd_mutations SELECT
    number,
    0
FROM numbers(1000);

SET mutations_sync = 2;

SELECT
    count(),
    sum(v),
    arraySort(groupUniqArray(id % 10))
FROM t_lwd_mutations;

SELECT
    count(),
    sum(`rows`),
    sum(has_lightweight_delete)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_lwd_mutations'
    AND active;