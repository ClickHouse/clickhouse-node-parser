SELECT *
FROM (
        SELECT
            max(column_1) AS column_1,
            NULL AS column_2,
            id
        FROM clickhouse_alias_issue_1
        GROUP BY id
        UNION ALL
        SELECT
            NULL AS column_1,
            max(column_2) AS column_2,
            id
        FROM clickhouse_alias_issue_2
        GROUP BY id
        SETTINGS prefer_column_name_to_alias = 1
    )
ORDER BY `ALL` DESC;

SELECT '-------------------------';

SELECT
    max(column_1) AS column_1,
    max(column_2) AS column_2,
    id
FROM (
        SELECT
            max(column_1) AS column_1,
            NULL AS column_2,
            id
        FROM clickhouse_alias_issue_1
        GROUP BY id
        UNION ALL
        SELECT
            NULL AS column_1,
            max(column_2) AS column_2,
            id
        FROM clickhouse_alias_issue_2
        GROUP BY id
        SETTINGS prefer_column_name_to_alias = 1
    ) AS T1
GROUP BY id
ORDER BY id DESC
SETTINGS prefer_column_name_to_alias = 1;

SELECT
    column_1 / column_2,
    id
FROM (
        SELECT
            max(column_1) AS column_1,
            max(column_2) AS column_2,
            id
        FROM (
                SELECT
                    max(column_1) AS column_1,
                    NULL AS column_2,
                    id
                FROM clickhouse_alias_issue_1
                GROUP BY id
                UNION ALL
                SELECT
                    NULL AS column_1,
                    max(column_2) AS column_2,
                    id
                FROM clickhouse_alias_issue_2
                GROUP BY id
                SETTINGS prefer_column_name_to_alias = 1
            ) AS T1
        GROUP BY id
        ORDER BY id DESC
        SETTINGS prefer_column_name_to_alias = 1
    ) AS T2
WHERE isNotNull(column_1)
    AND isNotNull(column_2)
SETTINGS prefer_column_name_to_alias = 1;

SELECT
    column_1 / column_2,
    id
FROM (
        SELECT
            max(column_1) AS column_1,
            max(column_2) AS column_2,
            id
        FROM (
                SELECT
                    max(column_1) AS column_1,
                    NULL AS column_2,
                    id
                FROM clickhouse_alias_issue_1
                GROUP BY id
                UNION ALL
                SELECT
                    NULL AS column_1,
                    max(column_2) AS column_2,
                    id
                FROM clickhouse_alias_issue_2
                GROUP BY id
            ) AS T1
        GROUP BY id
        ORDER BY id DESC
    ) AS T2
WHERE isNotNull(column_1)
    AND isNotNull(column_2);