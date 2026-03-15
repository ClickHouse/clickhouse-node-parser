CREATE TABLE t1_00856 (n Int32) ENGINE = Memory;
CREATE TABLE t2_00856 (a Int32, n Int32) ENGINE = Memory;
SELECT count() FROM t1_00856 WHERE if(1, 1, n = 0);
SELECT count(n) FROM t2_00856 WHERE if(1, 1, n = 0);
SELECT count() FROM t2_00856 WHERE if(1, 1, n = 0);
