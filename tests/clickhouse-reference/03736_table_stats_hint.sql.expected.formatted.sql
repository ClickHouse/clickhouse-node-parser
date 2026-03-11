SELECT `explain`
FROM (
        EXPLAIN PLAN keep_logical_steps = 1, actions = 1
        SELECT count()
        FROM
            partsupp
        CROSS JOIN part
        WHERE ps_partkey = p_partkey
            AND ps_availqty >= 10
    )
WHERE like(`explain`, '% Join: %')
    OR like(`explain`, '% ResultRows: %')
    OR like(`explain`, '% Expression (%')
    OR like(`explain`, '% ReadFromMergeTree %');