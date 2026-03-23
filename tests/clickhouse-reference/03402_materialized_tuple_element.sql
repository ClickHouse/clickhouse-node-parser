SET enable_analyzer = 1;
CREATE TABLE t (id Int32, d Tuple(year Int32, month Int32, day Int32))
ENGINE = MergeTree ORDER BY ();
INSERT INTO t (id, d) SELECT number, (2000 + number, 1 + number % 10, 1 + number % 30) FROM numbers(10);
SELECT *, dt FROM t;
