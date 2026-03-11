SELECT db1_03101.tbl.col FROM db1_03101.tbl;
SELECT db1_03101.* FROM tbl;
SELECT db1_03101 FROM tbl;
SELECT * FROM tbl;
SELECT count(*) FROM tbl;
SELECT * + * FROM VALUES('a UInt16', 1, 10);
SELECT '---';
SELECT * GROUP BY *;
-- not ok as every component of ORDER BY may contain ASC/DESC and COLLATE; though can be supported in some sense
-- but it works
SELECT * ORDER BY *;
SELECT * WHERE *; -- { serverError UNEXPECTED_EXPRESSION }
SELECT * FROM (SELECT 1 AS a) AS t, (SELECT 2 AS b) AS u;
-- equivalent to:
SELECT a, b FROM (SELECT 1 AS a) AS t, (SELECT 2 AS b) AS u;
SELECT * FROM (SELECT 1 AS a) AS t, (SELECT 1 AS a) AS u;
-- equivalent to:
SELECT t.a, u.a FROM (SELECT 1 AS a) AS t, (SELECT 1 AS a) AS u;
SELECT * FROM t;
-- equivalent to:
SELECT x, nest.* FROM t;
-- equivalent to:
SELECT x, nest.a, nest.b FROM t;
