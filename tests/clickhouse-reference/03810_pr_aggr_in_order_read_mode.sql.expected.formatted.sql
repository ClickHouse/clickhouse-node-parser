SELECT a
FROM t1
GROUP BY a
HAVING materialize(0)
SETTINGS parallel_replicas_local_plan = 1;