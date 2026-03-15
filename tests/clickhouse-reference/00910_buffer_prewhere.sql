CREATE TABLE mt (uid UInt64, ts DateTime, val Float64) ENGINE = MergeTree PARTITION BY toDate(ts) ORDER BY (uid, ts);
CREATE TABLE buf as mt ENGINE = Buffer({CLICKHOUSE_DATABASE:Identifier}, mt, 2, 10, 60, 10000, 100000, 1000000, 10000000);
SELECT count() from buf prewhere ts > toDateTime('2019-03-01 12:00:00') and ts < toDateTime('2019-03-02 12:00:00');
