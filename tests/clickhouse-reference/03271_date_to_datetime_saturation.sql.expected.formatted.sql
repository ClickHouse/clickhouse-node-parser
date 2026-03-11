SELECT count()
FROM test
WHERE stamp >= parseDateTimeBestEffort('2024-11-01');

SELECT count()
FROM test
WHERE toDateTime(stamp) >= parseDateTimeBestEffort('2024-11-01')
SETTINGS date_time_overflow_behavior = 'saturate';

SELECT count()
FROM test
WHERE toDateTime(stamp) >= parseDateTimeBestEffort('2024-11-01')
SETTINGS date_time_overflow_behavior = 'ignore';

SELECT count()
FROM test
WHERE toDateTime(stamp) >= parseDateTimeBestEffort('2024-11-01')
SETTINGS date_time_overflow_behavior = 'throw';

SELECT count()
FROM test
WHERE stamp >= toDateTime(0)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime(0);

SELECT count()
FROM test
WHERE stamp >= toDateTime('2024-10-24 21:30:00')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime('2024-10-24 21:30:00');

SELECT count()
FROM test
WHERE stamp >= toDateTime(4294967295)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime(4294967295);

SELECT count()
FROM test
WHERE stamp >= toDateTime(-1)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime(-1);

SELECT count()
FROM test
WHERE stamp >= toDateTime('1000-01-01 00:00:00')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime('1000-01-01 00:00:00');

SELECT count()
FROM test
WHERE stamp >= toDateTime('1970-01-01 00:00:00')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime('1970-01-01 00:00:00');

SELECT count()
FROM test
WHERE stamp >= toDateTime('2023-01-01 00:00:00')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime('2023-01-01 00:00:00');

SELECT count()
FROM test
WHERE stamp >= toDateTime('2100-12-31 23:59:59')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime('2100-12-31 23:59:59');

SELECT count()
FROM test
WHERE stamp >= toDateTime(2147483647)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime(2147483647);

SELECT count()
FROM test
WHERE stamp >= toDate('0000-01-01')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDate('0000-01-01');

SELECT count()
FROM test
WHERE stamp >= toDate('9999-12-31')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDate('9999-12-31');

SELECT count()
FROM test
WHERE toDate(stamp) >= toDateTime(0)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE toDate(identity(stamp)) >= toDateTime(0);

SELECT count()
FROM test
WHERE toDateTime(stamp) >= toDateTime(0)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE toDateTime(identity(stamp)) >= toDateTime(0);

SELECT count()
FROM test
WHERE stamp = toDate('2023-01-01')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) = toDate('2023-01-01');

SELECT count()
FROM test
WHERE stamp = toDateTime('2023-01-01 00:00:00')
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) = toDateTime('2023-01-01 00:00:00');

SELECT count()
FROM test
WHERE stamp < toDateTime(-1)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) < toDateTime(-1);

SELECT count()
FROM test
WHERE stamp > toDateTime(9999999999)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) > toDateTime(9999999999);

SELECT count()
FROM test
WHERE stamp >= toDateTime(NULL)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) >= toDateTime(NULL);

SELECT count()
FROM test
WHERE stamp <= toDate(NULL)
SETTINGS force_primary_key = 1;

SELECT count()
FROM test
WHERE identity(stamp) <= toDate(NULL);