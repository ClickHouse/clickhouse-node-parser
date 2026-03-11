SELECT count() AS result
FROM test
WHERE toHour(stamp, 'America/Montreal') = 7;