CREATE TABLE test_quantile
(
    x AggregateFunction(quantileTiming(0.2), UInt64)
)
ENGINE = Memory;

SELECT y
FROM (
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
        UNION ALL
        SELECT finalizeAggregation(x) AS y
        FROM test_quantile
    )
ORDER BY y ASC;