SELECT count() > 0
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_03789
        WHERE tenant = '5'
        ORDER BY event_time DESC
        LIMIT 5
    )
WHERE like(`explain`, '%InReverseOrder%');

SELECT count() > 0
FROM (
        EXPLAIN actions = 1
        SELECT *
        FROM test_03789
        WHERE tenant = '5'
        ORDER BY
            tenant ASC,
            event_time DESC
        LIMIT 5
    )
WHERE like(`explain`, '%InReverseOrder%');