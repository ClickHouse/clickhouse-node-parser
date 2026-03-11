SELECT if(outer_table.condition_value = 1, formatRowNoNewline('JSONEachRow', outer_table.result_date), '') AS json
FROM (
        SELECT
            1 AS condition_value,
            plus(toDate('2023-06-24'), toIntervalMonth(inner_table.`offset`)) AS result_date
        FROM (
                SELECT 2 AS `offset`
            ) AS inner_table
    ) AS outer_table;