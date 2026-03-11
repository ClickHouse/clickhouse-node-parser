SELECT Num
FROM limit_by
ORDER BY Num ASC
LIMIT 2 BY Num;

SELECT
    Num,
    count(*)
FROM limit_by
GROUP BY Num
ORDER BY Num ASC
LIMIT 2 BY Num;

SELECT
    Num,
    Name
FROM limit_by
ORDER BY Num ASC
LIMIT 1 BY Num, Name
LIMIT 3;

SELECT dummy
FROM remote('127.0.0.{2,3}', `system`.one)
LIMIT 1 BY dummy;

SELECT dummy
FROM remote('127.0.0.{2,3}', `system`.one)
LIMIT 2 BY dummy;

SELECT 1 AS one
FROM remote('127.0.0.{2,3}', `system`.one)
LIMIT 1 BY one;

SELECT toInt8(number / 5 + 100) AS x
FROM remote('127.0.0.1', `system`.numbers)
LIMIT 2 BY x
LIMIT 5;

SELECT 1 AS x
FROM remote('127.0.0.{2,3}', `system`.one)
ORDER BY dummy ASC
LIMIT 1 BY x;