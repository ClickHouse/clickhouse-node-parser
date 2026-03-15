CREATE TABLE join (UserID UInt64, loyalty Int8) ENGINE = Join(SEMI, LEFT, UserID);
SELECT
    loyalty,
    count()
FROM test.hits SEMI LEFT JOIN join USING UserID
GROUP BY loyalty
ORDER BY loyalty ASC;
