SELECT
        (SELECT max(i) FROM t1) as i,
        (SELECT max(i) FROM t1) as j,
        (SELECT max(i) FROM t1) as k,
        (SELECT max(i) FROM t1) as l
FROM t1;
SELECT 1;
