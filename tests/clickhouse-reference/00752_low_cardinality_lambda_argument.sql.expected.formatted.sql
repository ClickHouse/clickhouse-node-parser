SELECT arrayFilter(x -> x % 2 == 0, arr)
FROM lc_lambda;

SELECT arrayMap(i -> [resources_host[i]], arrayEnumerate(resources_host))
FROM test_array;

SELECT arrayMap(x -> (x + (arrayMap(y -> ((x + y) + toLowCardinality(1)), [])[1])), []);