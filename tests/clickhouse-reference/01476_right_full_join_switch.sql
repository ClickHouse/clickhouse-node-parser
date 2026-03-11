-- x is supertupe for `t.x` and `nr.x` from left and right since `x` is inside `USING`.
SELECT x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM t AS l LEFT JOIN nr AS r USING (x) ORDER BY t.x;
SELECT x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM t AS l RIGHT JOIN nr AS r USING (x) ORDER BY t.x;
SELECT x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM t AS l FULL JOIN nr AS r USING (x) ORDER BY t.x;
SELECT t.x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM nr AS l LEFT JOIN t AS r USING (x) ORDER BY t.x;
SELECT t.x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM nr AS l RIGHT JOIN t AS r USING (x) ORDER BY t.x;
SELECT t.x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM nr AS l FULL JOIN t AS r USING (x) ORDER BY t.x;
-- t.x is supertupe for `x` from left and right since `x` is inside `USING`.
SELECT t.x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM t AS l LEFT JOIN nr AS r USING (x) ORDER BY t.x;
SELECT t.x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM t AS l RIGHT JOIN nr AS r USING (x) ORDER BY t.x;
SELECT t.x, l.s, r.s, toTypeName(l.s), toTypeName(r.s) FROM t AS l FULL JOIN nr AS r USING (x) ORDER BY t.x;
