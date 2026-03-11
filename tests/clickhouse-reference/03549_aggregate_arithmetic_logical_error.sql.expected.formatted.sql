SELECT sumMerge(initializeAggregation('sumState', 1) * CAST('1.1.1.1', 'IPv4'));

SELECT sumMerge(y * a)
FROM (
        SELECT
            a,
            sumState(b) AS y
        FROM t
        GROUP BY a
    );