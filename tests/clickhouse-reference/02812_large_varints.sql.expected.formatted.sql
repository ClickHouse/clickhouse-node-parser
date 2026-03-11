SELECT topKWeightedState(65535)(now(), -2)
FORMAT Null;

SELECT number
FROM numbers(toUInt64(-1))
LIMIT 10
FORMAT Null;