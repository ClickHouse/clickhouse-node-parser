create table t( s String ) Engine=Memory as select arrayJoin (['a','b','c']);
SELECT round((sum(multiIf(s IN ('a', 'b'), 1, 0)) / count()) * 100) AS r
FROM cluster('test_cluster_two_shards', currentDatabase(), t);
CREATE TABLE test_alias(`a` Int64, `b` Int64, `c` Int64, `day` Date, `rtime` DateTime) ENGINE = Memory
as select 0, 0, 0, '2022-01-01', 0 from zeros(10);
