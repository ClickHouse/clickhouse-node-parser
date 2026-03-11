SELECT *
FROM
    t1
INNER JOIN tj
    USING (key1, key2, key3)
ORDER BY key1 ASC;