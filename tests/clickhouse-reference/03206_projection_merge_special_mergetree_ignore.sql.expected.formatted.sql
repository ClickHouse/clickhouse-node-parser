SELECT
    sum(eventcnt) AS eventcnt,
    type
FROM tp
GROUP BY type
ORDER BY
    eventcnt ASC,
    type ASC;