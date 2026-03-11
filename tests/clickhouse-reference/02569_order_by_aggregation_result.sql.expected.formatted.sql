SELECT
    (number = 1)
    AND (number = 2) AS value,
    sum(value) OVER ()
FROM numbers(1)
WHERE 1;

SELECT
    time,
    round(exp_smooth, 10),
    bar(exp_smooth, -9223372036854775807, 1048575, 50) AS bar
FROM (
        SELECT
            2
            OR (number = 0)
            OR (number >= 1) AS value,
            number AS time,
            exponentialTimeDecayedSum(2147483646)(value, time) OVER (RANGE BETWEEN CURRENT ROW AND CURRENT ROW) AS exp_smooth
        FROM numbers(1)
        WHERE 10
    )
WHERE 25;

SELECT
    argMax(col1, timestamp) AS col1,
    argMax(col2, timestamp) AS col2,
    col1 / col2 AS final_col
FROM ttttttt
GROUP BY col3
ORDER BY final_col DESC;

SELECT
    argMax(col1, timestamp) AS col1,
    col1 / 10 AS final_col,
    final_col + 1 AS final_col2
FROM ttttttt
GROUP BY col3;

SELECT
    if(empty(id), toString(device), id) AS device,
    multiIf(notEmpty(id), 'a', device == '00000000-0000-0000-0000-000000000000', 'b', 'c') AS device_id_type,
    count()
FROM table1
GROUP BY
    device,
    device_id_type
ORDER BY device ASC;