SELECT count()
FROM test_distr as left
GLOBAL INNER JOIN test_distr as right on left.id = right.id
WHERE has(right.data.arr1, 's3') AND has(right.data.arr2, 42) settings serialize_query_plan = 0;
SELECT count()
FROM test_distr as left
GLOBAL INNER JOIN test_distr as right on left.id = right.id
WHERE has(right.data.arr1, 's3') AND has(right.data.arr2, 42) settings enable_parallel_replicas = 0;
