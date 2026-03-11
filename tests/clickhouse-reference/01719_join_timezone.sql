SELECT
    toTimeZone(timestamp, 'America/Sao_Paulo') AS converted,
    timestamp AS original
FROM test
LEFT JOIN (SELECT 2 AS x) AS anything ON x = i
WHERE timestamp >= toDateTime('2020-05-13T00:00:00', 'America/Sao_Paulo');
/* This was incorrect result in previous ClickHouse versions:
┌─converted───────────┬─original────────────┐
│ 2020-05-13 16:38:45 │ 2020-05-13 16:38:45 │ <-- toTimeZone is ignored.
└─────────────────────┴─────────────────────┘
*/

SELECT
    toTimeZone(timestamp, 'America/Sao_Paulo') AS converted,
    timestamp AS original
FROM test
-- LEFT JOIN (SELECT 2 AS x) AS anything ON x = i -- Removing the join fixes the issue.
WHERE timestamp >= toDateTime('2020-05-13T00:00:00', 'America/Sao_Paulo');
/*
┌─converted───────────┬─original────────────┐
│ 2020-05-13 13:38:45 │ 2020-05-13 16:38:45 │ <-- toTimeZone works.
└─────────────────────┴─────────────────────┘
*/

SELECT
    toTimeZone(timestamp, 'America/Sao_Paulo') AS converted,
    timestamp AS original
FROM test
LEFT JOIN (SELECT 2 AS x) AS anything ON x = i
WHERE timestamp >= '2020-05-13T00:00:00'; -- Not using toDateTime in the WHERE also fixes the issue.
