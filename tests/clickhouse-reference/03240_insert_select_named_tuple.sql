SELECT * FROM dst;
SELECT id, tuple(replaceAll(data, 'a', 'e') AS col_a, type) AS a, tuple(replaceAll(data, 'a', 'e') AS col_b, type) AS b FROM cluster(test_cluster_two_shards, currentDatabase(), src) SETTINGS prefer_localhost_replica=0 FORMAT JSONEachRow;
