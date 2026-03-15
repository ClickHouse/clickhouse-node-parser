CREATE TABLE trend
(
    `event_date` Date,
    `user_id` Int32,
    `timestamp` DateTime,
    `eventID` Int32,
    `product` String
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(event_date)
ORDER BY user_id;
SELECT
    level,
    count() AS c
FROM
(
    SELECT
        user_id,
        windowFunnel(6048000000000000)(timestamp, eventID = 1004, eventID = 1003, eventID = 1002) AS level
    FROM trend
    GROUP BY user_id
)
GROUP BY level
ORDER BY level ASC;
SELECT '---';
