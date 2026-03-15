CREATE TABLE test_00687 (x String) ENGINE = Null;
create MATERIALIZED VIEW mv_bad (x String)
ENGINE = MergeTree Partition by tuple() order by tuple()
AS SELECT DISTINCT x FROM test_00687;
create MATERIALIZED VIEW mv_good (x String)
ENGINE = MergeTree Partition by tuple() order by tuple()
AS SELECT x FROM test_00687;
create MATERIALIZED VIEW mv_group (x String)
ENGINE = MergeTree Partition by tuple() order by tuple()
AS SELECT x FROM test_00687 group by x;
select * from mv_bad;
SELECT '---';
select * from mv_good;
select * from mv_group;
