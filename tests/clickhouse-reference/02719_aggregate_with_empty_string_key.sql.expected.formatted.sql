SELECT '-----------String------------';

SELECT
    str,
    max(i)
FROM test
GROUP BY str
ORDER BY str ASC;