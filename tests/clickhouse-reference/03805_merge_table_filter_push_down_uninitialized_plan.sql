-- This query used to cause "QueryPlan was not initialized" error
-- when filter push-down optimization tried to add filter to an uninitialized child plan
SELECT count() > 0 FROM viewExplain('EXPLAIN', '', (
    SELECT count() FROM foo_merge INNER JOIN t2 USING (Val)
    SETTINGS enable_join_runtime_filters = 1, parallel_replicas_local_plan = 1
));
