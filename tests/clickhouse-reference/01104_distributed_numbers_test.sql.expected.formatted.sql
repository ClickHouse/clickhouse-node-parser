-- Tags: distributed
SELECT *
FROM (
        SELECT *
        FROM `system`.numbers
        WHERE number = 100
        UNION ALL
        SELECT *
        FROM `system`.numbers
        WHERE number = 100
    )
LIMIT 2
SETTINGS max_threads = 1
FORMAT Null;

SELECT '100' AS number
FROM d_numbers AS n
WHERE n.number = 100
LIMIT 2;

SELECT '100' AS number
FROM d_numbers AS n
WHERE n.number = 100
LIMIT 2
SETTINGS
    max_threads = 1,
    prefer_localhost_replica = 1;

SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,1,1}', `system`.numbers) AS n
        WHERE n.number = 100
        LIMIT 3
    )
SETTINGS
    max_threads = 2,
    prefer_localhost_replica = 1;