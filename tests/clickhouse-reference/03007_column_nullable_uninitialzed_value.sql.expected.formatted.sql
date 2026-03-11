SELECT
    count(NULL) > avg(toDecimal32(NULL)),
    count()
FROM numbers(1000)
WITH TOTALS
SETTINGS enable_analyzer = 1;