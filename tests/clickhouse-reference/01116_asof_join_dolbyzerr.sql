SELECT
    visitorId,
    orderId,
    groupUniqArray(sessionId)
FROM sessions
ASOF INNER JOIN orders ON (sessions.visitorId = orders.visitorId) AND (sessions.date <= orders.date)
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
FROM sessions
ASOF INNER JOIN orders ON (sessions.visitorId = orders.visitorId) AND (sessions.date <= orders.date)
GROUP BY
    visitorId,
    orderId
ORDER BY
    visitorId ASC,
    orderId ASC
SETTINGS join_algorithm = 'full_sorting_merge';
