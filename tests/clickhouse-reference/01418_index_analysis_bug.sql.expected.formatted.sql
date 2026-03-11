SELECT
    eventday,
    count(*)
FROM mytable_local
WHERE (toYYYYMM(eventday) = 202007)
    AND (user_id = 742522)
    AND (eventday >= '2020-07-03')
    AND (eventday <= '2020-07-25')
GROUP BY eventday
ORDER BY eventday ASC;

SELECT count()
FROM table_float
WHERE (toUInt64(f) = 1)
    AND (f >= 1.3)
    AND (f <= 1.4)
    AND (u > 0);