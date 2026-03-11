SELECT count()
FROM t_lwu_multistep
WHERE a = 1
    AND b > 10000
    AND c < 100000;

SELECT count()
FROM t_lwu_multistep
WHERE a = 0
    AND b > 10000
    AND c < 100000;

SELECT count()
FROM t_lwu_multistep
WHERE a = 1
    AND b > 10000
    AND c > 200000;

SELECT count()
FROM t_lwu_multistep
WHERE a = 0
    AND b > 10000
    AND c > 200000;