SELECT explain FROM
(
    EXPLAIN PLAN keep_logical_steps=1, actions=1
    SELECT count() FROM partsupp, part WHERE ps_partkey = p_partkey AND ps_availqty >= 10
)
WHERE explain LIKE '% Join: %' OR explain LIKE '% ResultRows: %' OR explain LIKE '% Expression (%' OR explain LIKE '% ReadFromMergeTree %';
