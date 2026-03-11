SELECT *
FROM mergetree_00588
PREWHERE x = 1
WHERE like(s, '%l%')
ORDER BY
    x ASC,
    s ASC;

SELECT *
FROM remote('127.0.0.{1,2,3}', currentDatabase(), mergetree_00588)
PREWHERE x = 1
WHERE like(s, '%l%')
ORDER BY
    x ASC,
    s ASC;

SELECT *
FROM distributed_00588
PREWHERE x = 1
WHERE like(s, '%l%')
ORDER BY
    x ASC,
    s ASC;