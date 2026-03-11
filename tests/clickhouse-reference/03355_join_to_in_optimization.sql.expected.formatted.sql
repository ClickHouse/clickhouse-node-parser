SELECT
    t1.key,
    t1.key2
FROM
    t1
INNER JOIN t2
    ON (t1.id = t2.id)
    AND (t2.key = t2.key2)
ORDER BY
    t1.key ASC,
    t1.key2 ASC
SETTINGS
    query_plan_use_new_logical_join_step = true,
    query_plan_convert_join_to_in = true;

SELECT dummy
FROM
    (
        SELECT dummy
        FROM `system`.one
    ) AS a
INNER JOIN (
        SELECT dummy
        FROM `system`.one
    ) AS b
    USING (dummy)
INNER JOIN (
        SELECT dummy
        FROM `system`.one
    ) AS c
    USING (dummy)
SETTINGS
    query_plan_use_new_logical_join_step = true,
    query_plan_convert_join_to_in = true;

SELECT
    u,
    s
FROM
    t
INNER JOIN (
        SELECT CAST(number, 'Int32') AS u
        FROM numbers(10)
    ) AS t1
    USING (u)
FORMAT Null
SETTINGS query_plan_use_new_logical_join_step = true, query_plan_convert_join_to_in = true;

SELECT *
FROM
    v1 AS t1
INNER JOIN v1 AS t2
    USING (id)
CROSS JOIN v2 AS n1;

SELECT 10
FROM
    `system`.query_log AS a
INNER JOIN `system`.processes AS b
    ON (a.query_id = b.query_id)
    AND (a.query_id = b.query_id)
WHERE current_database = currentDatabase()
FORMAT Null
SETTINGS query_plan_use_new_logical_join_step = true, query_plan_convert_join_to_in = true;