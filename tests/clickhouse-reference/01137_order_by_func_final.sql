CREATE TABLE pk_func(d DateTime, ui UInt32) ENGINE = SummingMergeTree ORDER BY toDate(d);
SELECT toDate(d), ui FROM pk_func FINAL order by d;
