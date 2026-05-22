WITH c AS (
    SELECT
        1 AS ID,
        toDate('2023-06-24') AS dt,
        0 AS p
)

SELECT multiIf(t.ID = 1, formatRowNoNewline('JSONEachRow', dd), '') AS params
FROM (
        SELECT
            ID,
            multiIf(p = 0, toString(plus(dt, toIntervalHour(p))), '2022-01-01') AS dd
        FROM c
    ) AS t;

WITH c AS (
    SELECT
        1 AS ID,
        toDate('2023-06-24') AS dt,
        0 AS p
)

SELECT
    multiIf(t.ID = 1, formatRowNoNewline('JSONEachRow', dd), '') AS params,
    dd
FROM (
        SELECT
            ID,
            multiIf(p = 0, toString(plus(dt, toIntervalHour(p))), '2022-01-01') AS dd
        FROM c
    ) AS t;

SELECT if(outer_table.condition_value = 1, formatRowNoNewline('JSONEachRow', outer_table.result_date), '') AS json
FROM (
        SELECT
            1 AS condition_value,
            plus(toDate('2023-06-24'), toIntervalMonth(inner_table.`offset`)) AS result_date
        FROM (
                SELECT 2 AS `offset`
            ) AS inner_table
    ) AS outer_table;