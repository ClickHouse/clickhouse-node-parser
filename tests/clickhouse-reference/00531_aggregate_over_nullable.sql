SELECT arraySort(groupUniqArray(description)) FROM agg_over_nullable;
SELECT arraySort(topK(3)(description)) FROM agg_over_nullable;
