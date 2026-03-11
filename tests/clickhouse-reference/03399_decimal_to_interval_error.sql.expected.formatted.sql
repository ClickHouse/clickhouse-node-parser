SELECT toIntervalMillisecond(CAST(1 AS Decimal(18, 3)));

SELECT toIntervalSecond(CAST(1 AS Decimal(18, 3)));

SELECT toIntervalMillisecond(CAST(1 AS Nullable(Decimal(18, 3))));

SELECT toIntervalMillisecond(d)
FROM t;