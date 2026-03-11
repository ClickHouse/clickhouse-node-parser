SELECT uniqStateMap(map(1, x)) OVER (PARTITION BY y)
FROM test;

SELECT uniqStateForEach([x]) OVER (PARTITION BY y)
FROM test;

SELECT uniqStateResample(30, 75, 30)([x], 30) OVER (PARTITION BY y)
FROM test;

SELECT uniqStateForEachMapForEach([map(1, [x])]) OVER (PARTITION BY y)
FROM test;

SELECT uniqStateDistinctMap(map(1, x)) OVER (PARTITION BY y)
FROM test;