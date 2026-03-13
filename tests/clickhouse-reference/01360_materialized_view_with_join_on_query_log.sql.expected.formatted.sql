SELECT 1;

SELECT 1
WHERE NOT ignore(sleep(0.520)); /* QUERY_GROUP_ID:main_dashboard_top_query */

SELECT
    extract(query, '/\\*\\s*QUERY_GROUP_ID:(.*?)\\s*\\*/') AS QUERY_GROUP_ID,
    count()
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type <> 1
    AND event_date >= yesterday()
    AND QUERY_GROUP_ID <> ''
GROUP BY QUERY_GROUP_ID
ORDER BY QUERY_GROUP_ID ASC;

SELECT
    QUERY_GROUP_ID,
    count()
FROM slow_log
WHERE current_database = currentDatabase()
GROUP BY QUERY_GROUP_ID
ORDER BY QUERY_GROUP_ID ASC;