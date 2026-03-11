SELECT count() > 0
FROM viewExplain('EXPLAIN', '', (
        SELECT count()
        FROM
            foo_merge
        INNER JOIN t2
            USING (Val)
        SETTINGS
            enable_join_runtime_filters = 1,
            parallel_replicas_local_plan = 1
    ));