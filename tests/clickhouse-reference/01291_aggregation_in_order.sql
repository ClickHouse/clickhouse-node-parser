SET optimize_aggregation_in_order = 1;
CREATE TABLE pk_order(a UInt64, b UInt64, c UInt64, d UInt64) ENGINE=MergeTree() ORDER BY (a, b);
-- Order after group by in order is determined

SELECT a, b FROM pk_order GROUP BY a, b ORDER BY a, b;
SELECT a FROM pk_order GROUP BY a ORDER BY a;
SELECT a, b, sum(c), avg(d) FROM pk_order GROUP BY a, b ORDER BY a, b;
SELECT a, sum(c), avg(d) FROM pk_order GROUP BY a ORDER BY a;
SELECT -a, sum(c), avg(d) FROM pk_order GROUP BY -a ORDER BY -a;
CREATE TABLE pk_order (d DateTime, a Int32, b Int32) ENGINE = MergeTree ORDER BY (d, a)
    PARTITION BY toDate(d) SETTINGS index_granularity=1;
set max_block_size = 1;
SELECT d, max(b) FROM pk_order GROUP BY d, a ORDER BY d, a LIMIT 5;
SELECT toString(d), avg(a) FROM pk_order GROUP BY toString(d) ORDER BY toString(d) LIMIT 5;
SELECT toStartOfHour(d) as d1, min(a), max(b) FROM pk_order GROUP BY d1 ORDER BY d1 LIMIT 5;
