CREATE TABLE t0 (x UInt32, y UInt64) engine = MergeTree ORDER BY (x,y);
CREATE TABLE t1 (x UInt32, y UInt64) engine = MergeTree ORDER BY (x,y);
CREATE TABLE t2 (x UInt32, y UInt64) engine = MergeTree ORDER BY (x,y);
INSERT INTO t1 (x, y) VALUES (0, 0);
SET join_algorithm = 'partial_merge';
SELECT * FROM t1 ANY RIGHT JOIN t0 USING (x) ORDER BY x; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 ANY FULL JOIN t0 USING (x) ORDER BY x; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 RIGHT JOIN t0 USING (x) ORDER BY x;
SELECT * FROM t1 FULL JOIN t0 USING (x) ORDER BY x;
SELECT * FROM t1 ANY RIGHT JOIN t0 ON t1.x = t0.x ORDER BY x; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 ANY FULL JOIN t0 ON t1.x = t0.x ORDER BY x; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t1 RIGHT JOIN t0 ON t1.x = t0.x ORDER BY x;
SELECT * FROM t1 FULL JOIN t0 ON t1.x = t0.x ORDER BY x;
SELECT * FROM t0 ANY RIGHT JOIN t1 USING (x); -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t0 ANY FULL JOIN t1 USING (x); -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t0 RIGHT JOIN t1 USING (x);
SELECT * FROM t0 FULL JOIN t1 USING (x);
SELECT * FROM t0 ANY RIGHT JOIN t1 ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t0 ANY FULL JOIN t1 ON t1.x = t0.x; -- { serverError NOT_IMPLEMENTED }
SELECT * FROM t0 RIGHT JOIN t1 ON t1.x = t0.x;
SELECT * FROM t0 FULL JOIN t1 ON t1.x = t0.x;
SET join_use_nulls = 1;
INSERT INTO t1 (x, y) VALUES (1, 10) (2, 20);
INSERT INTO t1 (x, y) VALUES (4, 40) (3, 30);
INSERT INTO t2 (x, y) VALUES (4, 41) (2, 21) (2, 22);
INSERT INTO t2 (x, y) VALUES (0, 0) (5, 50) (4, 42);
SET join_use_nulls = 0;
SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.x = t2.x ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.y = t2.y ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.x = t2.x AND t1.y = t2.y ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.x = t2.x AND toUInt32(intDiv(t1.y,10)) = t2.x ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 RIGHT JOIN t2 ON t1.x = t2.x AND toUInt64(t1.x) = intDiv(t2.y,10) ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 FULL JOIN t2 ON t1.x = t2.x ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 FULL JOIN t2 ON t1.y = t2.y ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 FULL JOIN t2 ON t1.x = t2.x AND t1.y = t2.y ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 FULL JOIN t2 ON t1.x = t2.x AND toUInt32(intDiv(t1.y,10)) = t2.x ORDER BY x, t2.y;
SELECT t1.*, t2.* FROM t1 FULL JOIN t2 ON t1.x = t2.x AND toUInt64(t1.x) = intDiv(t2.y,10) ORDER BY x, t2.y;
