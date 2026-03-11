SELECT field1
FROM alias10__fuzz_13
WHERE arrayEnumerateDense(NULL, tuple('0.2147483646'), NULL)
GROUP BY
    field1,
    arrayEnumerateDense(('0.02', '0.1', '0'), NULL)
WITH TOTALS;

SELECT x
FROM distributed
GROUP BY x
WITH TOTALS;