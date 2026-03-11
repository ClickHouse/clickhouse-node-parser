SELECT a
FROM remote(test_cluster_two_shards, currentDatabase(), t)
GROUP BY a
ORDER BY a ASC
LIMIT 5
OFFSET 100500;

SELECT a
FROM remote(test_cluster_two_shards, currentDatabase(), dist_t)
GROUP BY a
ORDER BY a ASC
LIMIT 5
OFFSET 100500;

SELECT max(bs) < 70000
FROM (
        SELECT
            avg(a),
            max(blockSize()) AS bs
        FROM remote(test_cluster_two_shards, currentDatabase(), t)
        GROUP BY a
    );

SELECT
    a,
    count()
FROM dist_t_different_dbs
GROUP BY a
ORDER BY a ASC
LIMIT 5
OFFSET 500;

SELECT
    a,
    count()
FROM dist_t_different_dbs
GROUP BY
    a,
    b
ORDER BY a ASC
LIMIT 5
OFFSET 500;

SELECT count()
FROM pr_t;

SELECT
    a,
    count()
FROM pr_t
GROUP BY a
ORDER BY a ASC
LIMIT 5
OFFSET 500;

SELECT
    a,
    count()
FROM pr_t
GROUP BY
    a,
    b
ORDER BY a ASC
LIMIT 5
OFFSET 500;