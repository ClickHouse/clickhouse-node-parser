SELECT hostname();

SELECT
    hostName() AS h,
    count()
FROM cluster(test_cluster_two_shards, `system`.one)
GROUP BY h;