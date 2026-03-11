SELECT
    formatDateTime(toStartOfInterval(collectorReceiptTime, toIntervalHour(1)), '%Y-%m-%d %H') AS time,
    COUNT() AS count
FROM log
WHERE (collectorReceiptTime >= '2025-01-01 00:00:00') AND (collectorReceiptTime <= '2025-01-01 23:59:59')
GROUP BY time
ORDER BY time DESC;
SELECT
    formatDateTime(toStartOfInterval(collectorReceiptTime, toIntervalHour(1)), '%Y-%m-%d %H') AS time,
    COUNT() AS count
FROM log
WHERE (collectorReceiptTime >= '2025-01-01 00:00:00') AND (collectorReceiptTime <= '2025-01-01 23:59:59')
GROUP BY time
ORDER BY time DESC
SETTINGS force_optimize_projection = 1;
