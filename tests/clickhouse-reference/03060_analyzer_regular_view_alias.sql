SELECT
    toStartOfHour(b.datetime_value) AS datetime_desc,
    sum(b.value) AS value
FROM vt AS b
GROUP BY toStartOfHour(b.datetime_value);
