SELECT finalizeAggregation(CAST(quantileState(0)(arrayJoin([1,2,3])) AS AggregateFunction(quantile(1), UInt8)));

SELECT
    ifNotFinite(quantilesTimingMerge(0.95)(q)[1], 0) AS d1,
    ifNotFinite(quantilesTimingMerge(0.99)(q)[1], 0) AS d2,
    ifNotFinite(quantilesTimingMerge(0.50)(q)[1], 0) AS d3,
    sum(s)
FROM cluster('test_cluster_two_shards', currentDatabase(), r)
WHERE a = 'x'
SETTINGS prefer_localhost_replica = 0;

SELECT
    quantilesTimingMerge(0.95)(q),
    quantilesTimingMerge(toInt64(1))(q)
FROM remote('127.0.0.{1,2}', currentDatabase(), r);