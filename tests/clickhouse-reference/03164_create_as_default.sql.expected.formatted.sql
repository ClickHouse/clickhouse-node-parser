SELECT
    name,
    default_expression
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'src_table'
ORDER BY name ASC;

SELECT *
FROM src_table
ORDER BY time ASC
FORMAT JSONEachRow;

SELECT *
FROM copied_table
ORDER BY time ASC
FORMAT JSONEachRow;