CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = Memory;

SELECT
    uid,
    count(*) OVER ()
FROM users
GROUP BY ALL
FORMAT Null;