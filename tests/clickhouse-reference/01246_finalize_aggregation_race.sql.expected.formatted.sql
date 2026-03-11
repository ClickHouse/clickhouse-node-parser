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