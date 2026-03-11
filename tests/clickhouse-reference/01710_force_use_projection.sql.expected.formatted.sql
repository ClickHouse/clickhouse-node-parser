SELECT
    sum(eventcnt) AS eventcnt,
    d1
FROM tp
GROUP BY d1;

SELECT
    avg(eventcnt) AS eventcnt,
    d1
FROM tp
GROUP BY d1;