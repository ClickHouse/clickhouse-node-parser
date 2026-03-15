CREATE TABLE test_data
(
    ShipmentDate Date
)
ENGINE = Memory;
SELECT 
    toDayOfWeek(ShipmentDate) AS c
FROM test_data
WHERE c IS NOT NULL AND lowerUTF8(formatDateTime(date_add(DAY, toInt32(c) - 1, toDate('2024-01-01')), '%W')) LIKE '%m%'
GROUP BY c
ORDER BY c ASC
LIMIT 62
OFFSET 0;
