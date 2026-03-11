SELECT uniqStateMap(map(1, number))
FROM numbers(10);

SELECT uniqStateForEachMapForEachMap(map(1, [map(1, [number, number])]))
FROM numbers(10);

SELECT uniqStateForEachResample(30, 75, 30)([number, number + 1], 30)
FROM numbers(10);

SELECT uniqStateMapForEachResample(30, 75, 30)([map(1, number)], 30)
FROM numbers(10);

SELECT uniqStateForEachMerge(x) AS y
FROM (
        SELECT uniqStateForEachState([number]) AS x
        FROM numbers(10)
    );

SELECT uniqMerge(y[1])
FROM (
        SELECT uniqStateForEachMerge(x) AS y
        FROM (
                SELECT uniqStateForEachState([number]) AS x
                FROM numbers(10)
            )
    );

SELECT *
FROM test
FORMAT Null;

SELECT mapApply((k, v) -> (k, finalizeAggregation(v)), x)
FROM test;

SELECT mapApply((k, v) -> (k, arrayMap(x -> mapApply(k, v -> (k, arrayMap(x -> finalizeAggregation(x), v)), x), v)), x)
FROM test;

SELECT arrayMap(x -> arrayMap(x -> finalizeAggregation(x), x), x)
FROM test;

SELECT arrayMap(x -> arrayMap(x -> mapApply((k, v) -> (k, finalizeAggregation(v)), x), x), x)
FROM test;