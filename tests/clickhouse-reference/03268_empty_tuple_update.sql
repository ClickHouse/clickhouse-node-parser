CREATE TABLE t0 (c0 Tuple(), c1 int) ENGINE = Memory();
INSERT INTO t0 VALUES ((), 1);
SELECT * FROM t0;
