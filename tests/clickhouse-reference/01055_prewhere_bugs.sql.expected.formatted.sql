SELECT OperatingSystem
FROM test_prewhere_default_column
PREWHERE SessionType = 42;

SELECT
    a,
    y
FROM test_prewhere_column_type
PREWHERE (x = 2) AS y;

SELECT
    a,
    toTypeName(x = 2),
    toTypeName(x)
FROM test_prewhere_column_type
WHERE (x = 2) AS y;