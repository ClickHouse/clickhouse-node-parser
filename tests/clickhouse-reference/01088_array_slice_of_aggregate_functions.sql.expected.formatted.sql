SELECT arraySlice(groupArray(x), 1, 1) AS y
FROM (
        SELECT uniqState(number) AS x
        FROM numbers(10)
        GROUP BY number
        ORDER BY number ASC
    );