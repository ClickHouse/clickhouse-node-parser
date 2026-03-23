CREATE TABLE t (uid Int16, name String, age Nullable(Int8), i Int16, j Int16, projection p1 (select name, age, uniq(i), count(j) group by name, age)) ENGINE=MergeTree order by uid settings index_granularity = 1;
INSERT INTO t VALUES (1231, 'John', 11, 1, 1), (6666, 'Ksenia', 1, 2, 2), (8888, 'Alice', 1, 3, 3), (6667, 'Ksenia', null, 4, 4);
SET alter_sync = 0;
-- Projection query works without mutation applied.
SELECT count(j) FROM t GROUP BY name, age;
SET alter_sync = 1;
