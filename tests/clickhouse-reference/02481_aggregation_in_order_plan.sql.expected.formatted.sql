CREATE TABLE tab
(
    a Int32,
    b Int32,
    c Int32,
    d Int32
)
ENGINE = MergeTree
ORDER BY (a, b, c);

SELECT
    a,
    any(b),
    c,
    d
FROM tab
WHERE b = 1
GROUP BY
    a,
    c,
    d
ORDER BY
    c ASC,
    d ASC
SETTINGS
    optimize_aggregation_in_order = 1,
    query_plan_aggregation_in_order = 1;

SELECT *
FROM (
        EXPLAIN actions = 1, sorting = 1
        SELECT
            a,
            any(b),
            c,
            d
        FROM tab
        WHERE b = 1
        GROUP BY
            a,
            c,
            d
        SETTINGS
            optimize_aggregation_in_order = 1,
            query_plan_aggregation_in_order = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregating%')
    OR like(`explain`, '%Order:%')
SETTINGS enable_analyzer = 0;

SELECT *
FROM (
        EXPLAIN actions = 1, sorting = 1
        SELECT
            a,
            any(b),
            c,
            d
        FROM tab
        WHERE b = 1
        GROUP BY
            a,
            c,
            d
        SETTINGS
            optimize_aggregation_in_order = 1,
            query_plan_aggregation_in_order = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregating%')
    OR like(`explain`, '%Order:%')
SETTINGS enable_analyzer = 1;