SELECT 0 AS x
FROM remote('127.0.0.{1,2}', `system`.one)
GROUP BY x;

SELECT 0 AS x
FROM remote('127.0.0.{1,2}', `system`.one)
ORDER BY x ASC;