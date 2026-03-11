SELECT *
FROM
    cluster(test_cluster_two_shards, `system`.one) AS A
INNER JOIN (
        SELECT *
        FROM cluster(test_cluster_two_shards, `system`.one)
    ) AS B
    ON A.dummy = B.dummy;