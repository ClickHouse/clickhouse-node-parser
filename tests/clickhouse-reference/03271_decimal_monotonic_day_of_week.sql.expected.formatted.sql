SELECT count()
FROM decimal_dt
WHERE toDayOfWeek(timestamp) > 3;