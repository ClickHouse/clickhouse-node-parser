SELECT count()
FROM t_01411
WHERE str = 'asdf337';

SELECT count()
FROM t_01411
WHERE arr[1] = 'asdf337';

SELECT count()
FROM t_01411
WHERE has(arr, 'asdf337');

SELECT count()
FROM t_01411
WHERE indexOf(arr, 'asdf337') > 0;

SELECT count()
FROM t_01411
WHERE arr[1] = str;

SELECT count()
FROM t_01411
WHERE has(arr, str);

SELECT count()
FROM t_01411
WHERE indexOf(arr, str) > 0;

SELECT count()
FROM t_01411_num
WHERE num = 42;

SELECT count()
FROM t_01411_num
WHERE arr[1] = 42;

SELECT count()
FROM t_01411_num
WHERE has(arr, 42);

SELECT count()
FROM t_01411_num
WHERE indexOf(arr, 42) > 0;

SELECT count()
FROM t_01411_num
WHERE arr[1] = num;

SELECT count()
FROM t_01411_num
WHERE has(arr, num);

SELECT count()
FROM t_01411_num
WHERE indexOf(arr, num) > 0;

SELECT count()
FROM t_01411_num
WHERE indexOf(arr, num % 337) > 0;

SELECT indexOf(['a', 'b', 'c'], toLowCardinality('a'));

SELECT indexOf(['a', 'b', NULL], toLowCardinality('a'));