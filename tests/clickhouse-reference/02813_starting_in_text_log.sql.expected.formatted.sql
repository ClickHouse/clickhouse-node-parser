SELECT count() > 0
FROM `system`.text_log
WHERE event_date >= yesterday()
    AND like(message, '%Starting ClickHouse%');