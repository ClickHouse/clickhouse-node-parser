SELECT
    key,
    value1,
    value2,
    toUInt64(min(time)) AS start_ts
FROM join_inner_table
    PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1') AND (number > toUInt64('1610517366120'))
GROUP BY key, value1, value2
ORDER BY key, value1, value2
LIMIT 10;
-- Parallel inner query alone without analyzer
SELECT
    key,
    value1,
    value2,
    toUInt64(min(time)) AS start_ts
FROM join_inner_table
PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1') AND (number > toUInt64('1610517366120'))
GROUP BY key, value1, value2
ORDER BY key, value1, value2
LIMIT 10
SETTINGS enable_parallel_replicas = 1, enable_analyzer=0, parallel_replicas_only_with_analyzer=0;
SELECT ProfileEvents['ParallelReplicasQueryCount'], replaceRegexpAll(query, '_data_(\d+)_(\d+)', '_data_') as query
FROM system.query_log
WHERE
      event_date >= yesterday()
  AND type = 'QueryFinish'
  AND query_id IN
      (
          SELECT query_id
          FROM system.query_log
          WHERE
                current_database = currentDatabase()
            AND event_date >= yesterday()
            AND type = 'QueryFinish'
            AND query LIKE '-- Parallel inner query alone without analyzer%'
      );
-- Parallel inner query alone with analyzer
SELECT
    key,
    value1,
    value2,
    toUInt64(min(time)) AS start_ts
FROM join_inner_table
PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1') AND (number > toUInt64('1610517366120'))
GROUP BY key, value1, value2
ORDER BY key, value1, value2
LIMIT 10
SETTINGS enable_parallel_replicas = 1, enable_analyzer=1;
SELECT
    value1,
    value2,
    avg(count) AS avg
FROM
(
    SELECT
        key,
        value1,
        value2,
        count() AS count
    FROM join_outer_table
    INNER JOIN
    (
        SELECT
            key,
            value1,
            value2,
            toUInt64(min(time)) AS start_ts
        FROM join_inner_table
        PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1') AND (number > toUInt64('1610517366120'))
        GROUP BY key, value1, value2
    ) USING (key)
    GROUP BY key, value1, value2
)
GROUP BY value1, value2
ORDER BY value1, value2;
-- Parallel full query without analyzer
SELECT
    value1,
    value2,
    avg(count) AS avg
FROM
    (
        SELECT
            key,
            value1,
            value2,
            count() AS count
        FROM join_outer_table
        INNER JOIN
        (
            SELECT
                key,
                value1,
                value2,
                toUInt64(min(time)) AS start_ts
            FROM join_inner_table
            PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1') AND (number > toUInt64('1610517366120'))
            GROUP BY key, value1, value2
        ) USING (key)
        GROUP BY key, value1, value2
        )
GROUP BY value1, value2
ORDER BY value1, value2
SETTINGS enable_parallel_replicas = 1, enable_analyzer=0, parallel_replicas_only_with_analyzer=0;
-- Parallel full query with analyzer
SELECT
    value1,
    value2,
    avg(count) AS avg
FROM
    (
        SELECT
            key,
            value1,
            value2,
            count() AS count
        FROM join_outer_table
        INNER JOIN
        (
            SELECT
                key,
                value1,
                value2,
                toUInt64(min(time)) AS start_ts
            FROM join_inner_table
            PREWHERE (id = '833c9e22-c245-4eb5-8745-117a9a1f26b1') AND (number > toUInt64('1610517366120'))
            GROUP BY key, value1, value2
        ) USING (key)
        GROUP BY key, value1, value2
        )
GROUP BY value1, value2
ORDER BY value1, value2
SETTINGS enable_parallel_replicas = 1, enable_analyzer=1;
