SET allow_experimental_parallel_reading_from_replicas=1;
SET max_parallel_replicas=3;
SET enable_analyzer=1;
SET parallel_replicas_for_non_replicated_merge_tree=1;
SET cluster_for_parallel_replicas='parallel_replicas';
CREATE TABLE t0 (c0 Int) ENGINE = MergeTree() ORDER BY tuple();
CREATE TABLE t1 (c0 Int) ENGINE = MergeTree() ORDER BY tuple();
CREATE TABLE t2 (c0 Int) ENGINE = MergeTree() ORDER BY tuple();
SELECT * FROM (
    SELECT 1 FROM remote('localhost:9000', currentDatabase(), 't0') AS t0
    JOIN t1 ON t0.c0 = t1.c0
    RIGHT JOIN t2 ON t2.c0 = t1.c0
) FORMAT Null;
SELECT * FROM (
    SELECT 1 FROM remote('localhost:9000', currentDatabase(), 't0') AS t0
    JOIN t1 ON TRUE
    RIGHT JOIN t2 ON TRUE
) FORMAT Null;
