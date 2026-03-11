SELECT JSONExtract('{"utc" : 1747771112221}', 'utc', 'DateTime64(3)');

SELECT JSONExtract('{"utc" : -1747771112221}', 'utc', 'DateTime64(3)');

SELECT '{"utc" : 1747771112221}'::JSON(utc DateTime64);

SELECT '{"utc" : -1747771112221}'::JSON(utc DateTime64);