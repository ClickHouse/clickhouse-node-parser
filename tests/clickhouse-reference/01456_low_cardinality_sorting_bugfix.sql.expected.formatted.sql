SELECT
    color,
    toDateTime(timestamp) AS second
FROM order_test1
GROUP BY
    color,
    second
ORDER BY
    color ASC,
    second DESC;

SELECT
    color,
    timestamp
FROM order_test1
GROUP BY
    color,
    timestamp
ORDER BY
    color ASC,
    timestamp DESC;

SELECT '------cast to String----';

SELECT
    cast(color, 'String') AS color,
    toDateTime(timestamp) AS second
FROM order_test1
GROUP BY
    color,
    second
ORDER BY
    color ASC,
    second DESC;

SELECT
    cast(color, 'String') AS color,
    timestamp
FROM order_test1
GROUP BY
    color,
    timestamp
ORDER BY
    color ASC,
    timestamp DESC;