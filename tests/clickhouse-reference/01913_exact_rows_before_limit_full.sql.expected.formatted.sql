SELECT *
FROM test
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM test
WHERE i < 10
GROUP BY i
ORDER BY i ASC
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM test
GROUP BY i
HAVING i IN (10, 11, 12)
ORDER BY i ASC
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM test
WHERE i < 20
ORDER BY i ASC
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM cluster(test_cluster_two_shards, currentDatabase(), test)
WHERE i < 30
ORDER BY i ASC
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM cluster(test_cluster_two_shards, currentDatabase(), test)
WHERE i < 20
ORDER BY i ASC
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM (
        SELECT *
        FROM cluster(test_cluster_two_shards, currentDatabase(), test)
        WHERE i < 10
    )
ORDER BY i ASC
LIMIT 1
FORMAT JSONCompact;