SELECT x, lc, r.lc, toTypeName(r.lc) FROM t AS l LEFT JOIN nr AS r USING (x) ORDER BY x;
SELECT x, lc, r.lc, toTypeName(r.lc) FROM t AS l RIGHT JOIN nr AS r USING (x) ORDER BY x;
SELECT x, lc, r.lc, toTypeName(r.lc) FROM t AS l FULL JOIN nr AS r USING (x) ORDER BY x;
-- lc should be supertype for l.lc and r.lc, so expect Nullable(String)
SELECT x, lc, toTypeName(lc), r.lc, toTypeName(r.lc) FROM t AS l LEFT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 1;
SELECT x, lc, toTypeName(lc), r.lc, toTypeName(r.lc) FROM t AS l RIGHT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 1;
SELECT x, lc, toTypeName(lc), r.lc, toTypeName(r.lc) FROM t AS l FULL JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 1;
-- old behavior is different
SELECT x, lc, toTypeName(lc), r.lc, toTypeName(r.lc) FROM t AS l LEFT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 0;
SELECT x, lc, toTypeName(lc), r.lc, toTypeName(r.lc) FROM t AS l RIGHT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 0;
SELECT x, lc, toTypeName(lc), r.lc, toTypeName(r.lc) FROM t AS l FULL JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 0;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l LEFT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 1;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l RIGHT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 1;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l FULL JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 1;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l LEFT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 0;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l RIGHT JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 0;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l FULL JOIN nr AS r USING (lc) ORDER BY x SETTINGS enable_analyzer = 0;
SELECT x, lc FROM t AS l RIGHT JOIN nr AS r USING (lc) SETTINGS enable_analyzer = 1;
SELECT x, lc FROM t AS l RIGHT JOIN nr AS r USING (lc) SETTINGS enable_analyzer = 0;
SELECT x, lc, r.lc, toTypeName(r.lc) FROM t AS l LEFT JOIN nr AS r USING (lc) ORDER BY x;
SELECT x, lc, r.lc, toTypeName(r.lc) FROM t AS l RIGHT JOIN nr AS r USING (lc) ORDER BY x;
SELECT x, lc, r.lc, toTypeName(r.lc) FROM t AS l FULL JOIN nr AS r USING (lc) ORDER BY x;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l LEFT JOIN nr AS r USING (lc) ORDER BY x;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l RIGHT JOIN nr AS r USING (lc) ORDER BY x;
SELECT x, lc, materialize(r.lc) y, toTypeName(y) FROM t AS l FULL JOIN nr AS r USING (lc) ORDER BY x;
SELECT x, lc FROM t AS l RIGHT JOIN nr AS r USING (lc);
