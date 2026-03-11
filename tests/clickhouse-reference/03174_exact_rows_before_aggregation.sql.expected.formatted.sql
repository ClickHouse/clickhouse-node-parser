SELECT *
FROM test
WHERE i < 10
GROUP BY i
ORDER BY i ASC
FORMAT JSONCompact;

SELECT *
FROM test
WHERE i < 10
GROUP BY i
ORDER BY i ASC
FORMAT XML;

SELECT *
FROM test
GROUP BY i
HAVING i IN (10, 11, 12)
ORDER BY i ASC
FORMAT JSONCompact;

SELECT *
FROM test
WHERE i < 20
GROUP BY i
ORDER BY i ASC
FORMAT JSONCompact;

SELECT max(i)
FROM test
WHERE i < 20
LIMIT 1
FORMAT JSONCompact;

SELECT *
FROM cluster(test_cluster_two_shards, currentDatabase(), test)
WHERE i < 30
GROUP BY i
ORDER BY i ASC
FORMAT JSONCompact;

SELECT *
FROM cluster(test_cluster_two_shards, currentDatabase(), test)
WHERE i < 20
GROUP BY i
ORDER BY i ASC
FORMAT JSONCompact;

SELECT max(i)
FROM cluster(test_cluster_two_shards, currentDatabase(), test)
WHERE i < 20
FORMAT JSONCompact;

SELECT *
FROM (
        SELECT *
        FROM cluster(test_cluster_two_shards, currentDatabase(), test)
        WHERE i < 10
    )
GROUP BY i
ORDER BY i ASC
LIMIT 10
FORMAT JSONCompact;