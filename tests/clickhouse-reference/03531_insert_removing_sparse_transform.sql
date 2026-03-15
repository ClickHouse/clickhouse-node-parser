set max_threads=1;
set max_insert_threads=1;
set deduplicate_blocks_in_dependent_materialized_views=0;
-- { echo }

-- Log does not support sparse columns - RemovingSparseTransform added
create table t_log (key Int) engine=Log;
-- MergeTree support sparse columns - no RemovingSparseTransform
create table t_mt (key Int) engine=MergeTree order by ();
-- MergeTree pushes to Log, which does not support sparse columns - RemovingSparseTransform added
create materialized view mv to t_log as select * from t_mt;
-- Log does not support sparse columns - RemovingSparseTransform added
create materialized view mv to t_mt as select * from t_log;
