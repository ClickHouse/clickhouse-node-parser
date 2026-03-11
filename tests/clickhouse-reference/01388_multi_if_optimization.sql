-- fuzzed
SELECT now64(if(Null, NULL, if(Null, nan, toFloat64(number))), Null) FROM numbers(2);
