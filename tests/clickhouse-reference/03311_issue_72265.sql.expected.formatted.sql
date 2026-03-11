SELECT count()
FROM test_table_72265_1
WHERE (a > 100)
    AND ((a % 2) = toUInt128(0));

SELECT *
FROM test_table_72265_2
PREWHERE part = toUInt128(1);