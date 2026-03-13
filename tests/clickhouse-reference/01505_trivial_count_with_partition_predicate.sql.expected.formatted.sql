-- non-optimized
SELECT count()
FROM test1
SETTINGS max_parallel_replicas = 3;

-- optimized (toYear is monotonic and we provide the partition expr as is)
SELECT count()
FROM test1
WHERE toYear(toDate(p)) = 1999;

-- non-optimized (toDate(DateTime) is always monotonic, but we cannot relaxing the predicates to do trivial count())
SELECT count()
FROM test1
WHERE p > toDateTime('2020-09-01 10:00:00'); -- { serverError TOO_MANY_ROWS }

-- optimized (partition expr wrapped with non-monotonic functions)
SELECT count()
FROM test1
WHERE toDate(p) = '2020-09-01'
    AND sipHash64(toString(toDate(p))) % 2 = 1;

SELECT count()
FROM test1
WHERE toDate(p) = '2020-09-01'
    AND sipHash64(toString(toDate(p))) % 2 = 0;

-- non-optimized (some predicate depends on non-partition_expr columns)
SELECT count()
FROM test1
WHERE toDate(p) = '2020-09-01'
    AND k = 2; -- { serverError TOO_MANY_ROWS }

-- optimized
SELECT count()
FROM test1
WHERE toDate(p) > '2020-09-01';

-- non-optimized
SELECT count()
FROM test1
WHERE toDate(p) >= '2020-09-01'
    AND p <= '2020-09-01 00:00:00';

-- optimized
SELECT count()
FROM test_tuple
WHERE toDate(p) > '2020-09-01';

-- optimized
SELECT count()
FROM test_tuple
WHERE toDate(p) > '2020-09-01'
    AND i = 1;

-- optimized
SELECT count()
FROM test_tuple
WHERE i > 2;

-- optimized
SELECT count()
FROM test_tuple
WHERE i < 1;

-- non-optimized
SELECT count()
FROM
    test_tuple
ARRAY JOIN [p,p] AS c
WHERE toDate(p) = '2020-09-01'; -- { serverError TOO_MANY_ROWS }

SELECT count()
FROM
    test_tuple
ARRAY JOIN [1,2] AS c
WHERE toDate(p) = '2020-09-01'
SETTINGS max_rows_to_read = 4;

-- non-optimized
SELECT count()
FROM
    test_tuple
ARRAY JOIN [1,2,3] AS c
WHERE toDate(p) = '2020-09-01'; -- { serverError TOO_MANY_ROWS }

SELECT count()
FROM
    test_tuple
ARRAY JOIN [1,2,3] AS c
WHERE toDate(p) = '2020-09-01'
SETTINGS max_rows_to_read = 6;

-- optimized
SELECT count()
FROM test_two_args
WHERE i + j = 3;

-- non-optimized
SELECT count()
FROM test_two_args
WHERE i = 1; -- { serverError TOO_MANY_ROWS }