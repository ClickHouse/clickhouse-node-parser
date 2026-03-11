SELECT COUNT(1) == 1 FROM 02416_test;
SELECT COUNT(1) == 1000 FROM 02416_test;
SELECT uniqExact(key) == 32 FROM (SELECT * FROM 02416_test LIMIT 32 SETTINGS max_block_size = 1);
SELECT SUM(value) == 1 + 99 + 900 FROM 02416_test WHERE key IN ('1_1', '99_1', '900_1');
SELECT  A.a = B.a, A.b = B.b, A.c = B.c, A.d = B.d, A.e = B.e FROM ( SELECT 0 AS a, groupBitmapMerge(bm) AS b , SUM(k) AS c, SUM(value) AS d, SUM(dummy.1) AS e FROM 02416_test) A  ANY LEFT JOIN  (SELECT 0 AS a, groupBitmapMerge(bm) AS b , SUM(k) AS c, SUM(value) AS d, SUM(dummy.1) AS e FROM 02416_test_memory) B USING a ORDER BY a;
SELECT 0 == COUNT(1) FROM 02416_test;
