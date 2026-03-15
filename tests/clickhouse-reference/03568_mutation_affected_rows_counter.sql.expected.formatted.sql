CREATE TABLE t_mutation_rows_counter
(
    x UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SET mutations_sync = 2;

SELECT
    x,
    count()
FROM t_mutation_rows_counter
GROUP BY x
HAVING count() > 1;

SELECT
    ProfileEvents['MutatedRows'],
    ProfileEvents['MutationAffectedRowsUpperBound']
FROM `system`.part_log
WHERE database = currentDatabase()
    AND table = 't_mutation_rows_counter'
    AND event_type = 'MutatePart';