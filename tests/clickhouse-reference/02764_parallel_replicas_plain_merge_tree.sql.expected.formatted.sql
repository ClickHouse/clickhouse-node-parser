CREATE TABLE parallel_replicas_plain
(
    x String
)
ENGINE = MergeTree()
ORDER BY x;

SET max_parallel_replicas = 3, enable_parallel_replicas = 1, cluster_for_parallel_replicas = 'parallel_replicas';

SET send_logs_level = 'error';

SET parallel_replicas_for_non_replicated_merge_tree = 0;

SELECT x
FROM parallel_replicas_plain
LIMIT 1
FORMAT Null;

SELECT max(length(x))
FROM parallel_replicas_plain
FORMAT Null;

SET parallel_replicas_for_non_replicated_merge_tree = 1;