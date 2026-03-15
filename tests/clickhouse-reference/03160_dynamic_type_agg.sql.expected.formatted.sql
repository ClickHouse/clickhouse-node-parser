SET allow_experimental_dynamic_type = 1;

CREATE TABLE t
(
    d Dynamic
)
ENGINE = Memory;

SELECT
    finalizeAggregation(d.`AggregateFunction(sum, UInt64)`),
    sumMerge(d.`AggregateFunction(sum, UInt64)`)
FROM t
GROUP BY d.`AggregateFunction(sum, UInt64)`;