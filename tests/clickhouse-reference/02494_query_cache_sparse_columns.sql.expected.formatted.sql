CREATE TABLE t_cache_sparse
(
    id UInt64,
    v UInt64
)
ENGINE = MergeTree
ORDER BY id
SETTINGS ratio_of_defaults_for_sparse_serialization = 0.9;

SET max_threads = 1;

SELECT v
FROM t_cache_sparse
SETTINGS
    use_query_cache = 1,
    max_threads = 1
FORMAT Null;

SELECT count()
FROM `system`.query_cache
WHERE like(query, 'SELECT v FROM t_cache_sparse%');