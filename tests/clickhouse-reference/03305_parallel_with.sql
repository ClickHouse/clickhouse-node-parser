CREATE TABLE table1(x Int32) ENGINE=MergeTree order by x
PARALLEL WITH
CREATE TABLE table2(y Int32) ENGINE=MergeTree order by y;
SELECT * FROM table1 ORDER BY x;
SELECT * FROM table2 ORDER BY y;
