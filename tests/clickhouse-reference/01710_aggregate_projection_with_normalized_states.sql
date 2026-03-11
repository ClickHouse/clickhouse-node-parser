select finalizeAggregation(cast(quantileState(0)(arrayJoin([1,2,3])) as AggregateFunction(quantile(1), UInt8)));
SELECT
       ifNotFinite(quantilesTimingMerge(0.95)(q)[1],0) as d1,
       ifNotFinite(quantilesTimingMerge(0.99)(q)[1],0) as d2,
       ifNotFinite(quantilesTimingMerge(0.50)(q)[1],0) as d3,
       sum(s)
FROM cluster('test_cluster_two_shards', currentDatabase(), r)
WHERE a = 'x'
settings prefer_localhost_replica=0;
SELECT quantilesTimingMerge(0.95)(q), quantilesTimingMerge(toInt64(1))(q) FROM remote('127.0.0.{1,2}', currentDatabase(), r);
