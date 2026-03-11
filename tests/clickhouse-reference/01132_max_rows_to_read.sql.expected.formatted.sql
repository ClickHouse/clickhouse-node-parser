SELECT count()
FROM numbers(30);

SELECT count()
FROM numbers(19);

SELECT count()
FROM numbers(20);

SELECT count()
FROM numbers(21);

SELECT *
FROM numbers(30);

SELECT count()
FROM numbers(29);

SELECT count()
FROM numbers(31);

SELECT count()
FROM row_limits_fail_fast
WHERE key < 500000;

SELECT count()
FROM row_limits_fail_fast
WHERE key < 500;

SELECT count()
FROM row_limits_fail_fast
WHERE and(greaterOrEquals(key, 1000), lessOrEquals(key, 1500));

SELECT *
FROM row_limits_fail_fast
WHERE key < 200
FORMAT Null;

SELECT count()
FROM row_limits_fail_fast
WHERE key IN (1, 2, 3, 4, 5);

SELECT count()
FROM row_limits_fail_fast
WHERE key < 100000;

SELECT count()
FROM row_limits_fail_fast
WHERE key < 400;