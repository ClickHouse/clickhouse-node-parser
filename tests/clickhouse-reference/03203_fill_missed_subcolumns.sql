-- .null subcolumn

CREATE TABLE t_missed_subcolumns (x UInt32) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO t_missed_subcolumns SELECT * FROM numbers(10);
INSERT INTO t_missed_subcolumns SELECT number, if(number % 2, NULL, number) FROM numbers(10);
SELECT x FROM t_missed_subcolumns WHERE y IS NOT NULL SETTINGS optimize_functions_to_subcolumns = 1;
SELECT x FROM t_missed_subcolumns WHERE y IS NOT NULL SETTINGS optimize_functions_to_subcolumns = 0;
-- .null and .size0 subcolumn in array

CREATE TABLE t_missed_subcolumns (id UInt64, `n.a` Array(Nullable(String))) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_missed_subcolumns VALUES (1, ['aaa', NULL]) (2, ['ccc']) (3, [NULL]);
INSERT INTO t_missed_subcolumns VALUES (4, [NULL, 'bbb'], ['ddd', NULL]), (5, [NULL], [NULL]);
SELECT id, n.a, n.b FROM t_missed_subcolumns ORDER BY id;
SELECT id, n.a.size0, n.b.size0 FROM t_missed_subcolumns ORDER BY id;
SELECT id, n.a.null, n.b.null FROM t_missed_subcolumns ORDER BY id;
SELECT n.b.size0 FROM t_missed_subcolumns ORDER BY id;
-- subcolumns and custom defaults

CREATE TABLE t_missed_subcolumns (id UInt64) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_missed_subcolumns VALUES (1);
INSERT INTO t_missed_subcolumns VALUES (2, ('aaa', 'bbb'));
INSERT INTO t_missed_subcolumns VALUES (3, ('ccc', 'ddd'), [4, 5, 6]);
SELECT id, t, arr FROM t_missed_subcolumns ORDER BY id;
SELECT id, t.a, t.b, arr.size0, arr.null FROM t_missed_subcolumns ORDER BY id;
