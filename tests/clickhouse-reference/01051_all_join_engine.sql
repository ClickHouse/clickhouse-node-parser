SELECT * FROM t1 LEFT JOIN left_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 INNER JOIN inner_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 RIGHT JOIN right_join j USING(x) ORDER BY x, str, s;
SELECT * FROM t1 FULL JOIN full_join j USING(x) ORDER BY x, str, s;
