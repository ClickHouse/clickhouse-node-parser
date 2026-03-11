SELECT timestamp, value
FROM mytable FINAL
WHERE key = 5
ORDER BY timestamp DESC;
SELECT if(explain like '%ReadType: InOrder%', 'Ok', 'Error: ' || explain) FROM (
    EXPLAIN PLAN actions = 1
    SELECT timestamp, value
    FROM mytable FINAL
    WHERE key = 5
    ORDER BY timestamp SETTINGS enable_vertical_final = 0
) WHERE explain like '%ReadType%';
SELECT if(explain like '%ReadType: Default%', 'Ok', 'Error: ' || explain) FROM (
    EXPLAIN PLAN actions = 1
    SELECT timestamp, value
    FROM mytable FINAL
    WHERE key = 5
    ORDER BY timestamp DESC
) WHERE explain like '%ReadType%';
