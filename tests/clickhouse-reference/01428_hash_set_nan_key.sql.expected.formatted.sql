SELECT uniqExact(nan)
FROM numbers(1000);

SELECT uniqExact(number + nan)
FROM numbers(1000);

SELECT sumDistinct(number + nan)
FROM numbers(1000);

SELECT DISTINCT number + nan
FROM numbers(1000);

SELECT topKWeightedMerge(1)(initializeAggregation('topKWeightedState(1)', nan, arrayJoin(range(10))));

SELECT number + nan AS k
FROM numbers(256)
GROUP BY k;

SELECT uniqExact(reinterpretAsFloat64(reinterpretAsFixedString(reinterpretAsUInt64(reinterpretAsFixedString(nan)) + number)))
FROM numbers(10);