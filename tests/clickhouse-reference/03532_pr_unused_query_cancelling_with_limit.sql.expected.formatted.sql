CREATE TABLE pr_tt
(
    k UInt64,
    v String,
    blob String
)
ENGINE = MergeTree()
ORDER BY k;

SET enable_parallel_replicas = 1, cluster_for_parallel_replicas = 'parallel_replicas', parallel_replicas_for_non_replicated_merge_tree = 1;

SELECT *
FROM pr_tt
LIMIT 10
FORMAT Null;