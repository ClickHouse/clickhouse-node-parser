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