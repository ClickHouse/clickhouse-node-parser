SELECT toTypeName(sumArgMinState(number, number))
FROM numbers(1);

SELECT sumArgMinState(number, number) AS a
FROM numbers(3)
FORMAT Null;

CREATE TABLE argmax_comb
(
    id UInt64,
    state AggregateFunction(avgArgMax, Float64, UInt64)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT avgArgMaxMerge(state)
FROM argmax_comb;

SELECT
    id,
    avgArgMaxMerge(state)
FROM argmax_comb
GROUP BY id
ORDER BY id ASC;