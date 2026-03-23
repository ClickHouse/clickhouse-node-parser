SET optimize_on_insert = 0;
DROP TABLE IF EXISTS tt_01373;
CREATE TABLE tt_01373
(a Int64, d Int64, val Int64) 
ENGINE = SummingMergeTree PARTITION BY (a) ORDER BY (d) SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
INSERT INTO tt_01373 SELECT number%13, number%17, 1 from numbers(1000000);
SELECT '---';
SELECT count(*) FROM tt_01373;
SELECT count(*) FROM tt_01373 FINAL;
SELECT a, count() FROM tt_01373 FINAL GROUP BY a ORDER BY a;
SELECT a, count() FROM tt_01373 GROUP BY a ORDER BY a;
CREATE TABLE tt_01373_expr (a Int64, d Int64, val Int64) ENGINE = SummingMergeTree PARTITION BY (a % 2) ORDER BY (d + 0);
INSERT INTO tt_01373_expr VALUES (1, 1, 1), (1, 1, 2), (2, 1, 3);
SELECT *, _partition_id FROM tt_01373_expr ORDER BY (a, d, val);
DROP TABLE IF EXISTS tt_01373_expr;
