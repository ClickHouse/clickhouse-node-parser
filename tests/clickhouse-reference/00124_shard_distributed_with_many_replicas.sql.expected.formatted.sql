SELECT *
FROM (
        SELECT
            id,
            event_date,
            priority,
            description
        FROM remote('127.0.0.{2|3}', currentDatabase(), report)
    )
ORDER BY id ASC;