SET flatten_nested = 1;
CREATE TABLE t (x int, y int, z int) ORDER BY x;
CREATE MATERIALIZED VIEW mv ORDER BY () AS SELECT x, ([(y, z)])::Nested(y int, z int) FROM t;
INSERT INTO t VALUES (1, 2, 3);
SELECT * FROM mv;
CREATE TABLE t (x int, y Array(int), z Array(int)) ORDER BY x;
CREATE MATERIALIZED VIEW mv ORDER BY () AS SELECT x, arrayZip(y, z)::Nested(a int, b int) n FROM t;
INSERT INTO t VALUES (1, [1, 2], [3, 4]);
SELECT n.a[1], n.a[2], n.b[1], n.b[2] FROM mv;
