SELECT v
FROM t_cache_sparse
SETTINGS
    use_query_cache = 1,
    max_threads = 1
FORMAT Null;

SELECT count()
FROM `system`.query_cache
WHERE like(query, 'SELECT v FROM t_cache_sparse%');