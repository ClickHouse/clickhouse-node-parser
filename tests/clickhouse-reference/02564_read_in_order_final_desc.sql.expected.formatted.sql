SELECT
    timestamp,
    value
FROM mytable FINAL
WHERE key = 5
ORDER BY timestamp DESC;

SELECT if(like(`explain`, '%ReadType: InOrder%'), 'Ok', concat('Error: ', `explain`))
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            timestamp,
            value
        FROM mytable FINAL
        WHERE key = 5
        ORDER BY timestamp ASC
        SETTINGS enable_vertical_final = 0
    )
WHERE like(`explain`, '%ReadType%');

SELECT if(like(`explain`, '%ReadType: Default%'), 'Ok', concat('Error: ', `explain`))
FROM (
        EXPLAIN PLAN actions = 1
        SELECT
            timestamp,
            value
        FROM mytable FINAL
        WHERE key = 5
        ORDER BY timestamp DESC
    )
WHERE like(`explain`, '%ReadType%');