CREATE TABLE t_func_to_subcolumns_map (id UInt64, m Map(String, UInt64)) ENGINE = MergeTree ORDER BY id;
SET optimize_functions_to_subcolumns = 1;
SET enable_analyzer = 1;
SELECT length(m) FROM t_func_to_subcolumns_map;
SELECT empty(m) FROM t_func_to_subcolumns_map;
SELECT notEmpty(m) FROM t_func_to_subcolumns_map;
