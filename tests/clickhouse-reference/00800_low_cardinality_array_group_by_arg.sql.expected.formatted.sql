SELECT
    dt,
    id,
    arraySort(groupArrayArray(arr))
FROM (
        SELECT
            dt,
            id,
            arr
        FROM table1
        WHERE dt = '2019-01-14'
            AND id = 1
        UNION ALL
        SELECT
            dt,
            id,
            arr
        FROM table2
        WHERE dt = '2019-01-14'
            AND id = 1
    )
GROUP BY
    dt,
    id;