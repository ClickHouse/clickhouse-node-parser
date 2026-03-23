SET enable_analyzer = 1;
CREATE TABLE t_get_subcolumn (id UInt64, n Nested(u UInt64, s String)) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_get_subcolumn VALUES (1, [42], ['foo']);
SELECT getSubcolumn(n, 'u') FROM t_get_subcolumn;
SELECT getSubcolumn(n, 's') FROM t_get_subcolumn;
SELECT getSubcolumn(n, 'size0') FROM t_get_subcolumn;
