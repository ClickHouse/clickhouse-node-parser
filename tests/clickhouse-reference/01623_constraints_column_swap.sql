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
CREATE TABLE column_swap_test_test (i Int64, a String, b String, CONSTRAINT c1 ASSUME a = substring(reverse(b), 1, 1))
ENGINE = MergeTree() ORDER BY i
SETTINGS min_bytes_for_wide_part = 0;
CREATE TABLE t_bad_constraint(a UInt32, s String, CONSTRAINT c1 ASSUME a = toUInt32(s)) ENGINE = MergeTree ORDER BY tuple();
