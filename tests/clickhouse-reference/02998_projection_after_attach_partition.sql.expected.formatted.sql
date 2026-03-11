SELECT trimLeft(*)
FROM (
        EXPLAIN
        SELECT *
        FROM visits_order_dst
        WHERE user_name = 'another_user2'
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
    OR like(`explain`, '%ReadFromMergeTree%');