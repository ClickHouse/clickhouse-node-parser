SELECT toDayOfWeek(ShipmentDate) AS c
FROM test_data
WHERE isNotNull(c)
    AND like(lowerUTF8(formatDateTime(plus(toDate('2024-01-01'), toIntervalDay(toInt32(c) - 1)), '%W')), '%m%')
GROUP BY c
ORDER BY c ASC
LIMIT 62
OFFSET 0;