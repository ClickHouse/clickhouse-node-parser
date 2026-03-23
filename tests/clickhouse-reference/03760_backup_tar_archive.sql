CREATE TABLE t0 (c1 Int) ENGINE = MergeTree() ORDER BY c1 PARTITION BY (c1 % 6451);
SET min_insert_block_size_rows = 64, optimize_trivial_insert_select = 1;
INSERT INTO TABLE t0 (c1) SELECT number FROM numbers(500);
SELECT * FROM t1 ORDER BY c1 LIMIT 10;
