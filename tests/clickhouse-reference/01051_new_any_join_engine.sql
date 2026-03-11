SELECT * FROM t1 ANY LEFT JOIN any_left_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 ANY INNER JOIN any_inner_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 ANY RIGHT JOIN any_right_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 SEMI LEFT JOIN semi_left_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 SEMI RIGHT JOIN semi_right_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 ANTI LEFT JOIN anti_left_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 ANTI RIGHT JOIN anti_right_join j USING(x) ORDER BY x, str, s;
