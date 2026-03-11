SELECT
    toInt64(0) AS i0,
    toUInt64(0) AS u0,
    toInt64(9223372036854775807) AS ip,
    toInt64(-9223372036854775808) AS `in`,
    toUInt64(18446744073709551615) AS up,
    [toInt64(0)] AS arr,
    (toUInt64(0), toUInt64(0)) AS tuple
GROUP BY
    i0,
    u0,
    ip,
    `in`,
    up,
    arr,
    tuple
WITH TOTALS
FORMAT JSON;

SELECT
    toInt64(0) AS i0,
    toUInt64(0) AS u0,
    toInt64(9223372036854775807) AS ip,
    toInt64(-9223372036854775808) AS `in`,
    toUInt64(18446744073709551615) AS up,
    [toInt64(0)] AS arr,
    (toUInt64(0), toUInt64(0)) AS tuple
GROUP BY
    i0,
    u0,
    ip,
    `in`,
    up,
    arr,
    tuple
WITH TOTALS
FORMAT JSONCompact;

SELECT
    toInt64(0) AS i0,
    toUInt64(0) AS u0,
    toInt64(9223372036854775807) AS ip,
    toInt64(-9223372036854775808) AS `in`,
    toUInt64(18446744073709551615) AS up,
    [toInt64(0)] AS arr,
    (toUInt64(0), toUInt64(0)) AS tuple
GROUP BY
    i0,
    u0,
    ip,
    `in`,
    up,
    arr,
    tuple
WITH TOTALS
FORMAT JSONEachRow;