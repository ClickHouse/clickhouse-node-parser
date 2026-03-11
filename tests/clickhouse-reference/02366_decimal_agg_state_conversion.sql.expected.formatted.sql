SELECT sumMerge(y)
FROM (
        SELECT cast(x, 'AggregateFunction(sum, Decimal(50, 10))') AS y
        FROM (
                SELECT arrayReduce('sumState', [toDecimal256('0.000001', 10), toDecimal256('1.1', 10)]) AS x
            )
    );

SELECT minMerge(y)
FROM (
        SELECT cast(x, 'AggregateFunction(min, Decimal(18, 10))') AS y
        FROM (
                SELECT arrayReduce('minState', [toDecimal64('0.000001', 10), toDecimal64('1.1', 10)]) AS x
            )
    );

SELECT
    id,
    finalizeAggregation(dec)
FROM consumer_02366;