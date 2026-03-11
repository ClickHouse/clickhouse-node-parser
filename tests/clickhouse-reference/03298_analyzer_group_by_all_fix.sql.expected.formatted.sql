SELECT
    uid,
    count(*) OVER ()
FROM users
GROUP BY ALL
FORMAT Null;