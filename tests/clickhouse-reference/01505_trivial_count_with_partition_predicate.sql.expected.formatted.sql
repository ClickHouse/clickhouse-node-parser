SELECT count()
FROM test1
SETTINGS max_parallel_replicas = 3;

SELECT count()
FROM test1
WHERE toYear(toDate(p)) = 1999;

SELECT count()
FROM test1
WHERE p > toDateTime('2020-09-01 10:00:00');

SELECT count()
FROM test1
WHERE toDate(p) = '2020-09-01'
    AND sipHash64(toString(toDate(p))) % 2 = 1;

SELECT count()
FROM test1
WHERE toDate(p) = '2020-09-01'
    AND sipHash64(toString(toDate(p))) % 2 = 0;

SELECT count()
FROM test1
WHERE toDate(p) = '2020-09-01'
    AND k = 2;

SELECT count()
FROM test1
WHERE toDate(p) > '2020-09-01';

SELECT count()
FROM test1
WHERE toDate(p) >= '2020-09-01'
    AND p <= '2020-09-01 00:00:00';

SELECT count()
FROM test_tuple
WHERE toDate(p) > '2020-09-01';

SELECT count()
FROM test_tuple
WHERE toDate(p) > '2020-09-01'
    AND i = 1;

SELECT count()
FROM test_tuple
WHERE i > 2;

SELECT count()
FROM test_tuple
WHERE i < 1;

SELECT count()
FROM
    test_tuple
ARRAY JOIN [p,p] AS c
WHERE toDate(p) = '2020-09-01';

SELECT count()
FROM
    test_tuple
ARRAY JOIN [1,2] AS c
WHERE toDate(p) = '2020-09-01'
SETTINGS max_rows_to_read = 4;

SELECT count()
FROM
    test_tuple
ARRAY JOIN [1,2,3] AS c
WHERE toDate(p) = '2020-09-01';

SELECT count()
FROM
    test_tuple
ARRAY JOIN [1,2,3] AS c
WHERE toDate(p) = '2020-09-01'
SETTINGS max_rows_to_read = 6;

SELECT count()
FROM test_two_args
WHERE i + j = 3;

SELECT count()
FROM test_two_args
WHERE i = 1;