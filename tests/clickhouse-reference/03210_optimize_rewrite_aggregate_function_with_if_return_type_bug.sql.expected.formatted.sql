SELECT hex(countState(if(toNullable(number % 2 = 0), number, NULL)))
FROM numbers(5)
SETTINGS optimize_rewrite_aggregate_function_with_if = 1;

SELECT toTypeName(countState(if(toNullable(number % 2 = 0), number, NULL)))
FROM numbers(5)
SETTINGS optimize_rewrite_aggregate_function_with_if = 1;

SELECT arrayStringConcat(arraySlice(splitByString(', ', trimLeft(`explain`)), 2), ', ')
FROM (
        EXPLAIN QUERY TREE
        SELECT hex(countState(if(toNullable(number % 2 = 0), number, NULL)))
        FROM numbers(5)
        SETTINGS optimize_rewrite_aggregate_function_with_if = 1
    )
WHERE like(`explain`, '%AggregateFunction%');

SELECT toTypeName(uniqState(if(toNullable(number % 2 = 0), number, NULL)))
FROM numbers(5)
SETTINGS optimize_rewrite_aggregate_function_with_if = 1;

SELECT hex(uniqState(if(toNullable(number % 2 = 0), number, NULL)))
FROM numbers(5)
SETTINGS optimize_rewrite_aggregate_function_with_if = 1;

SELECT arrayStringConcat(arraySlice(splitByString(', ', trimLeft(`explain`)), 2), ', ')
FROM (
        EXPLAIN QUERY TREE
        SELECT hex(uniqState(if(toNullable(number % 2 = 0), number, NULL)))
        FROM numbers(5)
        SETTINGS optimize_rewrite_aggregate_function_with_if = 1
    )
WHERE like(`explain`, '%AggregateFunction%');

SELECT '----';