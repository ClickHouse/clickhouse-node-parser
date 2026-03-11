SELECT Key, any(Value), any(ConcatArraySimple), groupArrayArrayMerge(ConcatArrayComplex) FROM summing_mt_aggregating_column GROUP BY Key;
