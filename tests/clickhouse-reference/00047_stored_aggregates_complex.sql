set max_insert_threads = 1;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE stored_aggregates
(
	d	Date,
	k1 	UInt64,
	k2 	String,
	Sum 		AggregateFunction(sum, UInt64),
	Avg 		AggregateFunction(avg, UInt64),
	Uniq 		AggregateFunction(uniq, UInt64),
	Any 		AggregateFunction(any, String),
	AnyIf 		AggregateFunction(anyIf, String, UInt8),
	Quantiles 	AggregateFunction(quantiles(0.5, 0.9), UInt64),
	GroupArray	AggregateFunction(groupArray, String)
)
ENGINE = AggregatingMergeTree(d, (d, k1, k2), 8192);
SELECT d, k1, k2,
	sumMerge(Sum), avgMerge(Avg), uniqMerge(Uniq),
	anyMerge(Any), anyIfMerge(AnyIf),
	arrayMap(x -> round(x, 6), quantilesMerge(0.5, 0.9)(Quantiles)),
	groupArrayMerge(GroupArray)
FROM stored_aggregates
GROUP BY d, k1, k2
ORDER BY d, k1, k2;
SELECT d, k1,
	sumMerge(Sum), avgMerge(Avg), uniqMerge(Uniq),
	anyMerge(Any), anyIfMerge(AnyIf),
	arrayMap(x -> round(x, 6), quantilesMerge(0.5, 0.9)(Quantiles)),
	groupArrayMerge(GroupArray)
FROM stored_aggregates
GROUP BY d, k1
ORDER BY d, k1;
SELECT d,
	sumMerge(Sum), avgMerge(Avg), uniqMerge(Uniq),
	anyMerge(Any), anyIfMerge(AnyIf),
	arrayMap(x -> round(x, 6), quantilesMerge(0.5, 0.9)(Quantiles)),
	groupArrayMerge(GroupArray)
FROM stored_aggregates
GROUP BY d
ORDER BY d;
