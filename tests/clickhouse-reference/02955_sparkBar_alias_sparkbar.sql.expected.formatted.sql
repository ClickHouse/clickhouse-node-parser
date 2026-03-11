SELECT sparkbar(9)(event_date, cnt)
FROM (
        SELECT
            sum(value) AS cnt,
            event_date
        FROM spark_bar_test
        GROUP BY event_date
    );