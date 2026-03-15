SET enable_analyzer=1;
CREATE TABLE foo(Id Int32, Val Int32) Engine=MergeTree PARTITION BY Val ORDER BY Id;
CREATE TABLE foo1(Id Int32, Val Decimal32(9)) Engine=MergeTree PARTITION BY Val ORDER BY Id;
CREATE TABLE foo_merge as foo ENGINE=Merge(currentDatabase(), '^foo');
CREATE TABLE t2 (Id Int32, Val Int64, X UInt256) Engine=Memory;
SELECT explain FROM (
EXPLAIN
SELECT count()
FROM foo_merge JOIN t2 USING Val
SETTINGS enable_join_runtime_filters=1, parallel_replicas_local_plan=1
);
SELECT count()
FROM foo_merge JOIN t2 USING Val
SETTINGS enable_join_runtime_filters=0;
SELECT count()
FROM foo_merge JOIN t2 USING Val
SETTINGS enable_join_runtime_filters=1;
