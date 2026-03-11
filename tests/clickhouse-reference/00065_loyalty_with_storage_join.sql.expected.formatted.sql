SELECT
    loyalty,
    count()
FROM
    test.hits
LEFT JOIN `join`
    USING (UserID)
GROUP BY loyalty
ORDER BY loyalty ASC;