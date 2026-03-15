SET optimize_read_in_order = 1;
CREATE TABLE pk_order(a UInt64, b UInt64, c UInt64, d UInt64) ENGINE=MergeTree() ORDER BY (a, b);
SELECT b FROM pk_order ORDER BY a, b;
SELECT a FROM pk_order ORDER BY a, b;
SELECT a, b FROM pk_order ORDER BY a, b;
SELECT a, b FROM pk_order ORDER BY a DESC, b;
SELECT a, b FROM pk_order ORDER BY a, b DESC;
SELECT a, b FROM pk_order ORDER BY a DESC, b DESC;
SELECT a FROM pk_order ORDER BY a DESC;
SELECT a, b, c FROM pk_order ORDER BY a, b, c;
SELECT a, b, c FROM pk_order ORDER BY a DESC, b, c;
SELECT a, b, c FROM pk_order ORDER BY a, b DESC, c;
SELECT a, b, c FROM pk_order ORDER BY a, b, c DESC;
SELECT a, b, c FROM pk_order ORDER BY a DESC, b DESC, c;
SELECT a, b, c FROM pk_order ORDER BY a DESC, b, c DESC;
SELECT a, b, c FROM pk_order ORDER BY a, b DESC, c DESC;
SELECT a, b, c FROM pk_order ORDER BY a DESC, b DESC, c DESC;
CREATE TABLE pk_order (d DateTime, a Int32, b Int32) ENGINE = MergeTree ORDER BY (d, a)
    PARTITION BY toDate(d) SETTINGS index_granularity=1;
set max_block_size = 1;
-- Currently checking number of read rows while reading in pk order not working precise. TODO: fix it.
-- SET max_rows_to_read = 10;

SELECT d FROM pk_order ORDER BY d LIMIT 5;
SELECT d, b FROM pk_order ORDER BY d, b LIMIT 5;
SELECT d, a FROM pk_order ORDER BY d DESC, a DESC LIMIT 5;
SELECT d, a FROM pk_order ORDER BY d DESC, -a LIMIT 5;
SELECT toStartOfHour(d) as d1 FROM pk_order ORDER BY d1 LIMIT 5;
CREATE TABLE pk_order (a Int, b Int) ENGINE = MergeTree ORDER BY (a / b);
SELECT * FROM pk_order ORDER BY (a / b), a LIMIT 5;
