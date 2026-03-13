-- TODO: this query will fail if parallel_replicas_filter_pushdown is enabled
--       enable parallel_replicas_filter_pushdown setting explicitly
--       after https://github.com/ClickHouse/ClickHouse/issues/95524 is fixed
SELECT a
FROM t1
GROUP BY a
HAVING materialize(0)
SETTINGS parallel_replicas_local_plan = 1;