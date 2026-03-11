SELECT x, y,
    transform(x,
        (select groupArray(x) from (select x, y from updates order by x) t1),
        (select groupArray(y) from (select x, y from updates order by x) t2),
        y)
FROM test_xy
WHERE 1 ORDER BY x, y;
SELECT * FROM test_xy ORDER BY x, y;
