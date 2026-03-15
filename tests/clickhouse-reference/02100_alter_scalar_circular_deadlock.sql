CREATE TABLE foo (ts DateTime, x UInt64)
ENGINE = MergeTree PARTITION BY toYYYYMMDD(ts)
ORDER BY (ts);
SET mutations_sync = 1;
SELECT sum(x) == 42 FROM foo;
SELECT sum(x) == 9 FROM foo;
CREATE TABLE bar (ts DateTime, x UInt64)
ENGINE = Memory;
SELECT sum(x) == 42 FROM bar;
SELECT sum(x) == 9 FROM bar;
