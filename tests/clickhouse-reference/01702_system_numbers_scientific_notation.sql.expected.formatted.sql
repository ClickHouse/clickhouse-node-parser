SELECT *
FROM numbers(1e2)
FORMAT Null;

SELECT *
FROM numbers_mt(1e2)
FORMAT Null;

SELECT *
FROM numbers_mt('100')
FORMAT Null;

SELECT *
FROM numbers_mt(inf)
FORMAT Null;

SELECT *
FROM numbers_mt(nan)
FORMAT Null;