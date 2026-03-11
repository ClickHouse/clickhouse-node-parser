SELECT toTypeName([toDate('2000-01-01'), toDateTime('2000-01-01', 'Asia/Istanbul')]);

SELECT toTypeName([toDate('2000-01-01'), toDateTime('2000-01-01', 'Asia/Istanbul'), toDateTime64('2000-01-01', 5, 'Asia/Istanbul')]);

SELECT toTypeName([toDate('2000-01-01'), toDateTime('2000-01-01', 'Asia/Istanbul'), toDateTime64('2000-01-01', 5, 'Asia/Istanbul'), toDateTime64('2000-01-01', 6, 'Asia/Istanbul')]);

SELECT
    CAST(toDate('2000-01-01') AS DateTime('UTC')) AS x,
    toTypeName(x);

SELECT
    CAST(toDate('2000-01-01') AS DateTime64(5, 'UTC')) AS x,
    toTypeName(x);