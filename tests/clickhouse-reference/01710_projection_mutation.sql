DROP TABLE IF EXISTS t;
CREATE TABLE t (`key` UInt32, `created_at` Date, `value` UInt32, PROJECTION xxx (SELECT key, created_at, sum(value) GROUP BY key, created_at)) ENGINE = MergeTree PARTITION BY toYYYYMM(created_at) ORDER BY key;
INSERT INTO t SELECT 1 AS key, today() + (number % 30), number FROM numbers(1000);
