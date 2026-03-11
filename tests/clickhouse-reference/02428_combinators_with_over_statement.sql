select uniqStateMap(map(1, x)) OVER (PARTITION BY y) from test;
select uniqStateForEach([x]) OVER (PARTITION BY y) from test;
select uniqStateResample(30, 75, 30)([x], 30) OVER (PARTITION BY y) from test;
select uniqStateForEachMapForEach([map(1, [x])]) OVER (PARTITION BY y) from test;
select uniqStateDistinctMap(map(1, x)) OVER (PARTITION BY y) from test;
