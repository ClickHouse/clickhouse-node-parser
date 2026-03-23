SYSTEM DROP  TABLE IF EXISTS repro_hits;

CREATE TABLE repro_hits
(
    date Date,
    metric Float64
)
ENGINE = MergeTree()
ORDER BY date;

-- From https://github.com/ClickHouse/ClickHouse/issues/12513#issue-657202535
SELECT
    date AS period,
    1 AS having_check,
    min(date) AS period_start,
    addDays(max(date), 1) AS period_end,
    dateDiff('second', period_start, period_end) AS total_duration,
    sum(metric) AS metric_
FROM repro_hits
GROUP BY period
HAVING having_check != -1;

SELECT min(number) AS min_number
FROM numbers(10)
GROUP BY number
HAVING 1
ORDER BY min_number ASC;