CREATE TABLE mergetree_00609 (x UInt64, s String) ENGINE = MergeTree ORDER BY x;
SELECT CASE x WHEN 1 THEN 'hello' WHEN 2 THEN 'world' ELSE  'unknow' END FROM mergetree_00609;
SELECT count() AS cnt FROM (SELECT CASE x WHEN 1 THEN 'hello' WHEN 2 THEN 'world' ELSE  'unknow' END FROM mergetree_00609);
CREATE TABLE distributed_00609 AS mergetree_00609 ENGINE = Distributed(test_shard_localhost, currentDatabase(), mergetree_00609);
SELECT CASE x WHEN 1 THEN 'hello' WHEN 2 THEN 'world' ELSE  'unknow' END FROM distributed_00609;
SELECT count() AS cnt FROM (SELECT CASE x WHEN 1 THEN 'hello' WHEN 2 THEN 'world' ELSE  'unknow' END FROM distributed_00609);
