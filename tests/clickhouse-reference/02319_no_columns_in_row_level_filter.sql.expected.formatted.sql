SELECT count(1)
FROM test_table;

SELECT count(1)
FROM test_table
PREWHERE (n % 8192) < 4000;

SELECT count(1)
FROM test_table
WHERE (n % 8192) < 4000;

SELECT count(1)
FROM test_table
PREWHERE (n % 8192) < 4000
WHERE (n % 33) == 0;

SELECT count(1)
FROM test_table
PREWHERE 7 / ((n % 5)) > 2;

SELECT count(1)
FROM test_table
WHERE 7 / ((n % 5)) > 2;

SELECT count(1)
FROM test_table
PREWHERE 7 / ((n % 5)) > 2
WHERE (n % 33) == 0;