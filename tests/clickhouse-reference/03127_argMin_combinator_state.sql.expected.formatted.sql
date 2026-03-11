SELECT toTypeName(sumArgMinState(number, number))
FROM numbers(1);

SELECT sumArgMinState(number, number) AS a
FROM numbers(3)
FORMAT Null;

SELECT avgArgMaxMerge(state)
FROM argmax_comb;

SELECT
    id,
    avgArgMaxMerge(state)
FROM argmax_comb
GROUP BY id
ORDER BY id ASC;