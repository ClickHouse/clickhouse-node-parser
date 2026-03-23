SYSTEM drop  table if exists tab;

CREATE TABLE tab
(
    a Int32,
    b Int32,
    c Int32,
    d Int32
)
ENGINE = MergeTree
ORDER BY (a, b, c);

INSERT INTO tab SELECT
    0,
    number % 3,
    2 - intDiv(number, 3),
    ((number % 3 + 1)) * 10
FROM numbers(6);

INSERT INTO tab SELECT
    0,
    number % 3,
    2 - intDiv(number, 3),
    ((number % 3 + 1)) * 100
FROM numbers(6);

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