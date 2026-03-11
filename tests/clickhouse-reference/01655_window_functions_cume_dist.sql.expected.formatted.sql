SELECT '-- Basic functionality';

SELECT
    number,
    cume_dist() OVER (ORDER BY number ASC)
FROM numbers(5);

SELECT
    number,
    intDiv(number, 3) AS p,
    cume_dist() OVER (PARTITION BY p ORDER BY number ASC)
FROM numbers(10);

SELECT
    number,
    cume_dist() OVER (ORDER BY number DESC)
FROM numbers(5);

SELECT
    a,
    b,
    cume_dist() OVER (ORDER BY b ASC)
FROM test_cume_dist
ORDER BY
    b ASC,
    a ASC;

SELECT
    a,
    b,
    cume_dist() OVER (PARTITION BY a ORDER BY b ASC)
FROM test_cume_dist
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    b,
    cume_dist() OVER (ORDER BY b ASC)
FROM test_cume_dist
ORDER BY a ASC;

SELECT
    a,
    b,
    cume_dist() OVER (ORDER BY b ASC)
FROM test_cume_dist
ORDER BY a ASC;

SELECT
    a,
    b,
    cume_dist() OVER (ORDER BY b ASC)
FROM test_cume_dist
ORDER BY a ASC;

SELECT
    a,
    b,
    cume_dist() OVER (PARTITION BY a ORDER BY b ASC)
FROM test_cume_dist
WHERE a = 3;

SELECT
    a,
    b,
    cume_dist() OVER (PARTITION BY a ORDER BY b ASC)
FROM test_cume_dist
WHERE a = 7;

SELECT
    number,
    cume_dist() OVER (ORDER BY number ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
FROM numbers(5);