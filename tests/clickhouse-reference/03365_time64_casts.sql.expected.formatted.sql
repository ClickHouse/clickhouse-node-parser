SELECT toString(CAST(toTime64('01:02:03.123000', 6) AS Time64(3)));

SELECT toString(CAST(toTime64('01:02:03.123', 3) AS Time64(6)));

SELECT toTypeName(CAST(toTime64('01:02:03.123000', 6) AS Time64(3)));

SELECT toTypeName(CAST(toTime64('01:02:03.123', 3) AS Time64(6)));

SELECT CAST(toTime64('01:02:03.123000', 6) AS Time64(3)) = toTime64('01:02:03.123', 3);

SELECT CAST(toTime64('01:02:03.123', 3) AS Time64(6)) = toTime64('01:02:03.123000', 6);