SELECT
    level,
    count() AS c
FROM (
        SELECT
            user_id,
            windowFunnel(6048000000000000)(timestamp, eventID = 1004, eventID = 1003, eventID = 1002) AS level
        FROM trend
        GROUP BY user_id
    )
GROUP BY level
ORDER BY level ASC;

SELECT '---';