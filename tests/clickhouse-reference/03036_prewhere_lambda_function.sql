CREATE TABLE t (A Array(Int64)) Engine = MergeTree ORDER BY tuple();
SELECT * FROM t PREWHERE arrayExists(x -> x = 5, A);
