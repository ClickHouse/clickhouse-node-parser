SELECT boundingRatioMerge(state)
FROM (
        SELECT boundingRatioState(timestamp, event) AS state
        FROM rate_test
        UNION ALL
        SELECT boundingRatioState(timestamp, event)
        FROM rate_test2
        WHERE 1 = 0
    );