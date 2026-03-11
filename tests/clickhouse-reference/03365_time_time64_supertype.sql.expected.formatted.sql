SELECT toTypeName([toTime('00:00:00'), toTime('00:00:01')]);

SELECT toTypeName([toTime('00:00:00'), toTime64('00:00:01', 0)]);

SELECT toTypeName([toTime('00:00:00'), toTime64('00:00:01', 3)]);

SELECT toTypeName([toTime64('00:00:00.1', 1), toTime64('00:00:00.123', 3)]);

SELECT toTypeName([toTime64('00:00:00.010000', 6), toTime64('00:00:00.123', 3)]);

SELECT toTypeName([NULL, toTime('00:00:00')]);

SELECT toTypeName([NULL, toTime64('00:00:00', 6)]);

SELECT toTypeName([toTime('00:00:00'), NULL, toTime64('00:00:00', 6)]);

SELECT toTypeName(if(1, toTime('00:00:00'), toTime64('00:00:00', 6)));

SELECT toTypeName(if(0, toTime64('00:00:00', 3), toTime64('00:00:00', 6)));

SELECT toTypeName(multiIf(1, toTime64('00:00:00', 3), 0, toTime64('00:00:00', 6), toTime('00:00:00')));

SELECT toTypeName(x)
FROM (
        SELECT toTime('00:00:00') AS x
        UNION ALL
        SELECT toTime64('00:00:00', 6)
    )
LIMIT 1;

SELECT toTypeName([toTime('00:00:00'), 1]);

SELECT toTypeName([toTime64('00:00:00', 3), toDate('2020-01-01')]);

SELECT toTypeName([toTime64('00:00:00', 3), toDateTime('2020-01-01 00:00:00')]);