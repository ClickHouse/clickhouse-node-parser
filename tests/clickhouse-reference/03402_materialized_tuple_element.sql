SET enable_analyzer = 1;
CREATE TABLE t (id Int32, d Tuple(year Int32, month Int32, day Int32))
ENGINE = MergeTree ORDER BY ();
SELECT *, dt FROM t;
