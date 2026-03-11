SELECT
    name,
    (
        SELECT count()
        FROM numbers(50)
        WHERE number = age
    )
FROM users
ORDER BY name ASC
SETTINGS query_plan_merge_filter_into_join_condition = 0;