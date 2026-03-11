SELECT 1 FROM distributed_table1 AS t1 GLOBAL JOIN distributed_table2 AS t2 ON materialize(42) = t1.a;
SELECT count() FROM distributed_table1 AS t1 GLOBAL JOIN distributed_table2 AS t2 ON materialize(42) = t1.a;
SELECT t1.* FROM distributed_table1 AS t1 GLOBAL JOIN distributed_table2 AS t2 ON materialize(42) = t1.a;
SELECT t2.* FROM distributed_table1 AS t1 GLOBAL JOIN distributed_table2 AS t2 ON materialize(42) = t1.a;
