CREATE TABLE broken (time UInt64) ENGINE = MergeTree PARTITION BY toYYYYMMDD(toDate(time / 1000)) ORDER BY time;
SELECT * FROM broken WHERE time>-1;
