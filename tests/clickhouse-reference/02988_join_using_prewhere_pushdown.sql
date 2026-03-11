SELECT u, s FROM t
INNER JOIN ( SELECT number :: Int32 AS u FROM numbers(10) ) AS t1
USING (u)
WHERE u != 2
;
SELECT u, s, toTypeName(u) FROM t
FULL JOIN ( SELECT number :: UInt32 AS u FROM numbers(10) ) AS t1
USING (u)
WHERE u == 2
ORDER BY 1
;
