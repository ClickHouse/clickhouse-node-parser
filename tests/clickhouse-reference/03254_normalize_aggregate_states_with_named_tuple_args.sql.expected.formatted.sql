SELECT * APPLY(finalizeAggregation)
FROM (
        WITH (1, 2)::Tuple(a int, b int) AS nt

        SELECT
            uniqState(nt)::AggregateFunction(uniq, Tuple(int, int)) AS x,
            uniqState([nt])::AggregateFunction(uniq, Array(Tuple(int, int))) AS y,
            uniqState(map(nt, nt))::AggregateFunction(uniq, Map(Tuple(int, int), Tuple(int, int))) AS z
    )
FORMAT JSONEachRow;

SELECT
    id,
    uniqMerge(city_name_uniq)
FROM users2
GROUP BY id
ORDER BY id ASC;