SELECT
    eventType,
    timestamp,
    key
FROM test_table
WHERE (eventType IN ('2', '4'))
    AND (((timestamp >= max2(toInt64('1698938519999'), toUnixTimestamp64Milli(now64() - toIntervalDay(90))))
    AND (timestamp <= (toInt64('1707143315452') - 1))));

SELECT
    eventType,
    timestamp,
    key
FROM test_table FINAL
WHERE (eventType IN ('2', '4'))
    AND (((timestamp >= max2(toInt64('1698938519999'), toUnixTimestamp64Milli(now64() - toIntervalDay(90))))
    AND (timestamp <= (toInt64('1707143315452') - 1))));