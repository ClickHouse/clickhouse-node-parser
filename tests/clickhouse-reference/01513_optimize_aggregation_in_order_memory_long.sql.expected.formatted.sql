SELECT
    key,
    groupArray(repeat('a', 200)),
    count()
FROM data_01513
GROUP BY key
FORMAT Null
SETTINGS optimize_aggregation_in_order = 0; -- { serverError MEMORY_LIMIT_EXCEEDED }

SELECT
    key,
    groupArray(repeat('a', 200)),
    count()
FROM data_01513
GROUP BY key
FORMAT Null
SETTINGS optimize_aggregation_in_order = 1;

-- for WITH TOTALS previous groups should be kept.
SELECT
    key,
    groupArray(repeat('a', 200)),
    count()
FROM data_01513
GROUP BY key
WITH TOTALS
FORMAT Null
SETTINGS optimize_aggregation_in_order = 1; -- { serverError MEMORY_LIMIT_EXCEEDED }