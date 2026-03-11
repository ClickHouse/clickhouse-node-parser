SELECT c0
FROM
    t0
INNER JOIN t0 AS tx
    USING (c0)
ORDER BY c0 ASC
SETTINGS
    query_plan_join_shard_by_pk_ranges = 1,
    max_threads = 2;