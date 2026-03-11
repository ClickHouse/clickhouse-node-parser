-- min_time and max_time are not filled

SELECT partition, toTimeZone(MIN(min_time), 'UTC') as min_time, toTimeZone(MAX(max_time), 'UTC') as max_time
FROM system.parts
WHERE database = currentDatabase() and table = 'datetime_table' AND active = 1
GROUP BY partition
ORDER BY partition ASC
FORMAT CSV;
-- min_time and max_time are now filled

SELECT partition, toUnixTimestamp(MIN(min_time)) as min_unix_time, toUnixTimestamp(MAX(max_time)) as max_unix_time
FROM system.parts
WHERE database = currentDatabase() and table = 'datetime_table' AND active = 1
GROUP BY partition
ORDER BY partition ASC
FORMAT CSV;
