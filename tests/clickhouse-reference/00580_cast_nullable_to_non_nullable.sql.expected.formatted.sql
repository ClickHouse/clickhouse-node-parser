SELECT CAST(if(number = 999999, NULL, number) AS UInt64)
FROM `system`.numbers
LIMIT 10;