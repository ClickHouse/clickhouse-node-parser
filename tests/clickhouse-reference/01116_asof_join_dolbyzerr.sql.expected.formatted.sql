CREATE TEMPORARY TABLE sessions
(
    date DateTime,
    visitorId String,
    sessionId String
);

CREATE TEMPORARY TABLE orders
(
    date DateTime,
    visitorId String,
    orderId String
);

SELECT
    visitorId,
    orderId,
    groupUniqArray(sessionId)
FROM
    sessions
INNER JOIN orders
    ON (sessions.visitorId = orders.visitorId)
    AND (sessions.date <= orders.date)
GROUP BY
    visitorId,
    orderId
ORDER BY
    visitorId ASC,
    orderId ASC;

SELECT
    visitorId,
    orderId,
    groupUniqArray(sessionId)
FROM
    sessions
INNER JOIN orders
    ON (sessions.visitorId = orders.visitorId)
    AND (sessions.date <= orders.date)
GROUP BY
    visitorId,
    orderId
ORDER BY
    visitorId ASC,
    orderId ASC
SETTINGS join_algorithm = 'full_sorting_merge';