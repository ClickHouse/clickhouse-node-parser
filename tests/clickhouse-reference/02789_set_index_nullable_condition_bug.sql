SELECT * FROM tab
WHERE 1 == 1 AND col1 == col1 OR
       0 AND col2 == NULL;
SELECT count() FROM tab WHERE col OR col IS NULL;
