SELECT *
FROM (
        SELECT
            id,
            event_date,
            priority,
            description
        FROM remote('127.0.0.{2,3}', currentDatabase(), report1)
        UNION ALL
        SELECT
            id,
            event_date,
            priority,
            description
        FROM remote('127.0.0.{2,3}', currentDatabase(), report2)
    )
ORDER BY
    id ASC,
    event_date ASC;