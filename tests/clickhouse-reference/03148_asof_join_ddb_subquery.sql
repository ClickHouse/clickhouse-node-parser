SELECT
    begin,
    value IN (
        SELECT e1.value
        FROM (
            SELECT *
            FROM events e1
            WHERE e1.value = events.value
        ) AS e1
        ASOF JOIN (
            SELECT number :: Float64 AS begin
            FROM numbers(10)
            WHERE number >= 1 AND number < 10
        )
        USING (begin)
    )
FROM events
ORDER BY begin ASC;
