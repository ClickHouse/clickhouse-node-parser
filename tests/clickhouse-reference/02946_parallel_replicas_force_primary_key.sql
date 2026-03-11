-- w/o parallel replicas
SELECT
    k,
    count()
FROM t1
WHERE k > 0
GROUP BY k
ORDER BY k
SETTINGS force_primary_key = 1, enable_parallel_replicas = 0;
SELECT
    k,
    count()
FROM t1
WHERE k > 0
GROUP BY k
ORDER BY k
SETTINGS force_primary_key = 1;
-- parallel replicas, primary key is NOT used
SELECT
    k,
    count()
FROM t1
GROUP BY k
ORDER BY k
SETTINGS force_primary_key = 1; -- { serverError INDEX_NOT_USED }
