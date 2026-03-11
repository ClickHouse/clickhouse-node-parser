SELECT str
FROM lc_str_0;

SELECT str
FROM lc_null_str_0;

SELECT val
FROM lc_int8_0;

SELECT val
FROM lc_null_int8_0;

SELECT str
FROM lc_fix_str_0;

SELECT str
FROM lc_null_fix_str_0;

SELECT
    toLowCardinality('a') AS s,
    toTypeName(s),
    toTypeName(length(s))
FROM `system`.one;

SELECT toLowCardinality('a') AS val
GROUP BY val
ORDER BY val ASC;

SELECT concat((toLowCardinality('a') AS val), 'b')
GROUP BY val
ORDER BY val ASC;

SELECT toLowCardinality(z) AS val
FROM (
        SELECT arrayJoin(['c', 'd']) AS z
    )
GROUP BY val
ORDER BY val ASC;

SELECT concat((toLowCardinality(z) AS val), 'b')
FROM (
        SELECT arrayJoin(['c', 'd']) AS z
    )
GROUP BY val
ORDER BY val ASC;

SELECT
    toUUID(str1),
    toUUID(str2),
    toUUID(str3)
FROM lc_str_uuid;

SELECT
    toUUID(str1, '', NULL),
    toUUID(str2, '', NULL),
    toUUID(str3, '', NULL)
FROM lc_str_uuid;