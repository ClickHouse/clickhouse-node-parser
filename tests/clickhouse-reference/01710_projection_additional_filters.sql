set parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;
CREATE TABLE t(a UInt32, b UInt32) ENGINE = MergeTree PARTITION BY a ORDER BY a;
SELECT count(), min(a), max(a) FROM t SETTINGS additional_table_filters = {'t' : '0'};
create table atf_p (x UInt64) engine = MergeTree order by tuple();
select count() from atf_p settings additional_table_filters = {'atf_p': 'x <= 2'};
