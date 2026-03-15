SET optimize_on_insert = 0;
CREATE TABLE tt_01373
(a Int64, d Int64, val Int64) 
ENGINE = SummingMergeTree PARTITION BY (a) ORDER BY (d) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
SELECT '---';
SELECT count(*) FROM tt_01373;
SELECT count(*) FROM tt_01373 FINAL;
SELECT a, count() FROM tt_01373 FINAL GROUP BY a ORDER BY a;
SELECT a, count() FROM tt_01373 GROUP BY a ORDER BY a;
CREATE TABLE tt_01373_expr (a Int64, d Int64, val Int64) ENGINE = SummingMergeTree PARTITION BY (a % 2) ORDER BY (d + 0);
SELECT *, _partition_id FROM tt_01373_expr ORDER BY (a, d, val);
