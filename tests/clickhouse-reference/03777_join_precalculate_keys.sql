CREATE TABLE t0 (c0 Int, c1 Int) ENGINE = Memory;
SET enable_analyzer=1;
SET enable_parallel_replicas=0;
SET enable_join_runtime_filters=1;
SELECT explain
FROM (
   EXPLAIN header=1, keep_logical_steps=1
   SELECT 1 FROM t0 JOIN (SELECT 1 a) tx ON t0.c0 = tx.a
);
SELECT 1 FROM t0 JOIN (SELECT 1 a) tx ON t0.c0 = tx.a;
SELECT explain
FROM (
   EXPLAIN header=1, keep_logical_steps=1
   SELECT 1 FROM t0 JOIN (SELECT 1 AS a, 2 AS b) tx ON t0.c0 = tx.a AND t0.c1 = tx.b
);
SELECT 1 FROM t0 JOIN (SELECT 1 AS a, 2 AS b) tx ON t0.c0 = tx.a AND t0.c1 = tx.b;
