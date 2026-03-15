SET enable_json_type = 1;

SET allow_experimental_analyzer = 1;

CREATE TABLE test
(
    id Int64,
    data JSON(arr1 Array(String), arr2 Array(Int32))
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE test_distr
(
    id Int64,
    data JSON(arr1 Array(String), arr2 Array(Int32))
)
ENGINE = Distributed(test_cluster_one_shard_three_replicas_localhost, currentDatabase(), 'test', murmurHash2_32(id));

SELECT count()
FROM
    test_distr AS `left`
INNER JOIN test_distr AS `right`
    ON `left`.id = `right`.id
WHERE has(`right`.data.arr1, 's3')
    AND has(`right`.data.arr2, 42)
SETTINGS serialize_query_plan = 0;

SELECT count()
FROM
    test_distr AS `left`
INNER JOIN test_distr AS `right`
    ON `left`.id = `right`.id
WHERE has(`right`.data.arr1, 's3')
    AND has(`right`.data.arr2, 42)
SETTINGS enable_parallel_replicas = 0;