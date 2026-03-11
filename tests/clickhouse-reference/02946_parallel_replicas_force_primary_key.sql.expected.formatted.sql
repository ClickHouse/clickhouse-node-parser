SELECT
    k,
    count()
FROM t1
WHERE k > 0
GROUP BY k
ORDER BY k ASC
SETTINGS
    force_primary_key = 1,
    enable_parallel_replicas = 0;

SELECT
    k,
    count()
FROM t1
WHERE k > 0
GROUP BY k
ORDER BY k ASC
SETTINGS force_primary_key = 1;

SELECT
    k,
    count()
FROM t1
GROUP BY k
ORDER BY k ASC
SETTINGS force_primary_key = 1;