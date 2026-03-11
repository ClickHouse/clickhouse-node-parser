SELECT *
FROM t__fuzz_0
PREWHERE 7
    AND (i < 2147483647)
    AND (j IN (2147483646, -2, 1))
SETTINGS enable_analyzer = true;