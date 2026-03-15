CREATE TABLE t_comp_subcolumns (id UInt32, n Nullable(String), arr Array(Array(UInt32)))
ENGINE = MergeTree ORDER BY id;
SELECT sum(n.null) FROM t_comp_subcolumns;
SELECT n.null FROM t_comp_subcolumns LIMIT 10000, 5;
SELECT sum(arr.size0) FROM t_comp_subcolumns;
SELECT sumArray(arr.size1) FROM t_comp_subcolumns;
