SELECT '---';
SELECT key, length(t1.s), length(t2.s) FROM t1 AS t1 ALL FULL JOIN tn2 AS t2 USING (key) ORDER BY key, length(t1.s), length(t2.s);
