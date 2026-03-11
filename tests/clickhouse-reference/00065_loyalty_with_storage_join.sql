SELECT
    loyalty,
    count()
FROM test.hits SEMI LEFT JOIN join USING UserID
GROUP BY loyalty
ORDER BY loyalty ASC;
