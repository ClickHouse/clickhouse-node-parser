CREATE TABLE expected_times (QUERY_GROUP_ID String, max_query_duration_ms UInt64) Engine=Memory;
SET log_queries=1;
SELECT 1;
-- NOTE: can be rewritten using log_queries_min_query_duration_ms

CREATE MATERIALIZED VIEW slow_log Engine=Memory AS
(
        SELECT * FROM
        (
            SELECT
                extract(query,'/\\*\\s*QUERY_GROUP_ID:(.*?)\\s*\\*/') as QUERY_GROUP_ID,
                *
            FROM system.query_log
            WHERE type<>1 and event_date >= yesterday()
        ) as ql
        INNER JOIN expected_times USING (QUERY_GROUP_ID)
        WHERE query_duration_ms > max_query_duration_ms
);
SELECT 1 WHERE not ignore(sleep(0.520)) /* QUERY_GROUP_ID:main_dashboard_top_query */;
SET log_queries=0;
SELECT
    extract(query,'/\\*\\s*QUERY_GROUP_ID:(.*?)\\s*\\*/') as QUERY_GROUP_ID,
    count()
FROM system.query_log
WHERE current_database = currentDatabase() AND type<>1 and event_date >= yesterday() and QUERY_GROUP_ID<>''
GROUP BY QUERY_GROUP_ID
ORDER BY QUERY_GROUP_ID;
SELECT
    QUERY_GROUP_ID,
    count()
FROM slow_log
WHERE current_database = currentDatabase()
GROUP BY QUERY_GROUP_ID
ORDER BY QUERY_GROUP_ID;
