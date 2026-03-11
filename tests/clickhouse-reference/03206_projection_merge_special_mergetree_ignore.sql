SELECT sum(eventcnt) eventcnt, type
FROM tp
GROUP BY type
ORDER BY eventcnt, type;
