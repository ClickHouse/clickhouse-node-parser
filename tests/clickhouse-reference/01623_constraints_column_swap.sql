-- Tags: no-random-merge-tree-settings

SET convert_query_to_cnf = 1;
SET optimize_using_constraints = 1;
SET optimize_move_to_prewhere = 1;
SET optimize_substitute_columns = 1;
SET optimize_append_index = 1;
SET optimize_trivial_insert_select = 1;
CREATE TABLE column_swap_test_test (i Int64, a String, b UInt64, CONSTRAINT c1 ASSUME b = cityHash64(a))
ENGINE = MergeTree() ORDER BY i
SETTINGS min_bytes_for_wide_part = 0;
INSERT INTO column_swap_test_test VALUES (1, 'cat', 1), (2, 'dog', 2);
INSERT INTO column_swap_test_test SELECT number AS i, format('test {} kek {}', toString(number), toString(number + 10))  AS a, 1 AS b FROM system.numbers LIMIT 1000000;
CREATE TABLE column_swap_test_test (i Int64, a String, b String, CONSTRAINT c1 ASSUME a = substring(reverse(b), 1, 1))
ENGINE = MergeTree() ORDER BY i
SETTINGS min_bytes_for_wide_part = 0;
INSERT INTO column_swap_test_test SELECT number AS i, toString(number) AS a, format('test {} kek {}', toString(number), toString(number + 10)) b FROM system.numbers LIMIT 1000000;
CREATE TABLE t_bad_constraint(a UInt32, s String, CONSTRAINT c1 ASSUME a = toUInt32(s)) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO t_bad_constraint SELECT number, randomPrintableASCII(100) FROM numbers(10000);
