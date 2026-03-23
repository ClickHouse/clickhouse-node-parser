CREATE TABLE t1 (id UInt32, s String) Engine = MergeTree ORDER BY id;
CREATE TABLE t2 (id1 UInt32, id2 UInt32) Engine = MergeTree ORDER BY id1 SETTINGS index_granularity = 1;
INSERT INTO t2 SELECT number, number from numbers(100);
SELECT s FROM t1 as lhs LEFT JOIN (SELECT * FROM t2 WHERE id2 = 2) as rhs ON lhs.id = rhs.id2;
