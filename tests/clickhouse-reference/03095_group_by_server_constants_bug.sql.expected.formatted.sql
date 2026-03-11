SELECT
    serverUUID() AS s,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY s
FORMAT Null;

SELECT
    getMacro('replica') AS s,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY s;

SELECT
    uptime() AS s,
    count()
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY s
FORMAT Null;