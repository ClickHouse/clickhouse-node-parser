SET enable_analyzer = 1;
CREATE TABLE spark_bar_test (`value` Int64, `event_date` Date) ENGINE = MergeTree ORDER BY event_date;
SELECT sparkbar(9)(event_date,cnt) FROM (SELECT sum(value) as cnt, event_date FROM spark_bar_test GROUP BY event_date);
