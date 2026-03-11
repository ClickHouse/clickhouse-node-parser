SELECT c0 FROM t0 JOIN t0 tx USING (c0) ORDER BY c0 SETTINGS query_plan_join_shard_by_pk_ranges = 1, max_threads = 2;
