SELECT *
FROM dist_01223;

SELECT DISTINCT *
FROM dist_01223
ORDER BY key ASC;

SELECT *
FROM dist_01223
GROUP BY key
ORDER BY key ASC;

SELECT *
FROM dist_01223
GROUP BY key
ORDER BY key ASC
LIMIT 1;

SELECT *
FROM dist_01223
HAVING key = 1;

SELECT *
FROM dist_01223
GROUP BY key
HAVING key = 1;

SELECT *
FROM dist_01223
ORDER BY key ASC;

SELECT *
FROM dist_01223
ORDER BY key ASC
LIMIT 1;

SELECT *
FROM dist_01223
ORDER BY key ASC
LIMIT 1 BY key;

SELECT *
FROM cluster(test_cluster_two_shards, currentDatabase(), dist_01223)
ORDER BY key ASC;

SELECT *
FROM cluster(test_cluster_two_shards, currentDatabase(), dist_01223)
GROUP BY key
ORDER BY key ASC;

SELECT
    a.key,
    b.key
FROM
    (
        SELECT toInt32(number) AS key
        FROM numbers(2)
    ) AS a
LEFT JOIN (
        SELECT DISTINCT *
        FROM dist_01223
    ) AS b
    USING (key)
ORDER BY b.key ASC;

SELECT
    a.key,
    b.key
FROM
    (
        SELECT toInt32(number) AS key
        FROM numbers(2)
    ) AS a
RIGHT JOIN (
        SELECT DISTINCT *
        FROM dist_01223
    ) AS b
    USING (key)
ORDER BY b.key ASC;

SELECT *
FROM dist_01223
GROUP BY key
ORDER BY key ASC
SETTINGS
    group_by_two_level_threshold = 1,
    group_by_two_level_threshold_bytes = 1;

SELECT *
FROM dist_01223
GROUP BY key
ORDER BY key ASC
SETTINGS distributed_aggregation_memory_efficient = 1;

SELECT *
FROM dist_01223
GROUP BY key
ORDER BY key ASC
SETTINGS
    group_by_two_level_threshold = 1,
    group_by_two_level_threshold_bytes = 1,
    distributed_aggregation_memory_efficient = 1;

SELECT count()
FROM dist_01223;

SELECT count()
FROM dist_01223
SETTINGS distributed_group_by_no_merge = 1;

SELECT count()
FROM merge_dist_01223;

SELECT count()
FROM merge_dist_01223
SETTINGS distributed_group_by_no_merge = 1;

SELECT DISTINCT *
FROM dist_01223
WHERE key GLOBAL IN (
        SELECT toInt32(1)
    );