-- Create a table with DateTime column, but not used in partition key
CREATE TABLE datetime_table
  (
    t DateTime('UTC'),
    name String,
    value UInt32
  ) ENGINE = MergeTree()
    ORDER BY (t, name)
	PARTITION BY value;
-- min_time and max_time are not filled

SELECT partition, toTimeZone(MIN(min_time), 'UTC') as min_time, toTimeZone(MAX(max_time), 'UTC') as max_time
FROM system.parts
WHERE database = currentDatabase() and table = 'datetime_table' AND active = 1
GROUP BY partition
ORDER BY partition ASC
FORMAT CSV;
-- Create a table with DateTime column, this time used in partition key
CREATE TABLE datetime_table
  (
    t DateTime('UTC'),
    name String,
    value UInt32
  ) ENGINE = MergeTree()
    ORDER BY (t, name)
	PARTITION BY toStartOfDay(t);
-- Create a table with DateTime column, this time used in partition key, but not at the first level
CREATE TABLE datetime_table
  (
    t DateTime('UTC'),
    name String,
    value UInt32
  ) ENGINE = MergeTree()
    ORDER BY (t, name)
        PARTITION BY (name, toUInt32(toUnixTimestamp(t)/(60*60*24)) );
-- min_time and max_time are now filled

SELECT partition, toUnixTimestamp(MIN(min_time)) as min_unix_time, toUnixTimestamp(MAX(max_time)) as max_unix_time
FROM system.parts
WHERE database = currentDatabase() and table = 'datetime_table' AND active = 1
GROUP BY partition
ORDER BY partition ASC
FORMAT CSV;
