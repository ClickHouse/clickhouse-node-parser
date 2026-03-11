SELECT toTypeName(now());

SELECT toTypeName(now() - 1);

SELECT toTypeName(now('UTC') - 1);

SELECT toTypeName(now64(3));

SELECT toTypeName(now64(3) - 1);

SELECT toTypeName(toTimeZone(now64(3), 'UTC') - 1);