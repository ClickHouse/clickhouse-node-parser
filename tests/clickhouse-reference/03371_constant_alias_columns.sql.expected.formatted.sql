SELECT y
FROM test_table
ORDER BY c ASC;

SELECT '----';

SELECT y
FROM remote('127.0.0.{1,2}', currentDatabase(), test_table)
ORDER BY c ASC
SETTINGS extremes = 1;

SELECT
    a,
    b,
    c,
    d,
    n.x,
    n.y
FROM test_table
ORDER BY c ASC;