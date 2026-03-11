SELECT a % 6 AS n, sum(b), groupUniqArray(c) FROM t_lwu_add_column GROUP BY n ORDER BY n;
SELECT * FROM t_lwu_add_column ORDER BY a LIMIT 10;
