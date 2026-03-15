CREATE TABLE 02476_query_parameters_insert (x Int32) ENGINE=MergeTree() ORDER BY tuple();
SET param_x = 1;
SELECT * FROM 02476_query_parameters_insert;
