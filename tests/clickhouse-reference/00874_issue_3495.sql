SELECT * FROM (
    SELECT a, t1.val as val1, t2.val as val2
    FROM t t1
    ANY LEFT JOIN t t2 USING a
) ORDER BY val1;
