

SELECT * FROM test1 LEFT JOIN test2 ON test1.col1 = test2.col1
WHERE test2.col1 IS NULL
ORDER BY test2.col1
;
SELECT * FROM test2 RIGHT JOIN test1 ON test2.col1 = test1.col1
WHERE test2.col1 IS NULL
ORDER BY test2.col1
;
SELECT * FROM test1 LEFT JOIN test2 ON test1.col1 = test2.col1
WHERE test2.col1 IS NOT NULL
ORDER BY test2.col1
;
SELECT * FROM test2 RIGHT JOIN test1 ON test2.col1 = test1.col1
WHERE test2.col1 IS NOT NULL
ORDER BY test2.col1
;
SELECT test2.col1, test1.* FROM test2 RIGHT JOIN test1 ON test2.col1 = test1.col1
WHERE test2.col1 IS NOT NULL
ORDER BY test2.col1
;
SELECT test2.col3, test1.* FROM test2 RIGHT JOIN test1 ON test2.col1 = test1.col1
WHERE test2.col1 IS NOT NULL
ORDER BY test2.col1
;
SELECT col2, col2 + 1 FROM test1
FULL OUTER JOIN test2 USING (col1)
PREWHERE (col2 * 2) :: UInt8
;
