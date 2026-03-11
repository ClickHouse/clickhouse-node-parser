SELECT *
FROM (
        SELECT
            number,
            count()
        FROM numbers(2)
        GROUP BY number
        WITH TOTALS
    )
WHERE number > 0
SETTINGS enable_optimize_predicate_expression = 0;

SELECT
    dimension_1,
    sum_metric_1,
    sum_metric_2
FROM
    (
        SELECT
            dimension_1,
            sum(metric_1) AS sum_metric_1
        FROM foo
        GROUP BY dimension_1
        WITH TOTALS
    ) AS subquery_1
FULL JOIN (
        SELECT
            dimension_1,
            sum(metric_2) AS sum_metric_2
        FROM bar
        GROUP BY dimension_1
        WITH TOTALS
    ) AS subquery_2
    USING (dimension_1)
WHERE sum_metric_2 < 20
ORDER BY dimension_1 ASC;