SELECT
    number,
    number
FROM
    `system`.numbers
INNER JOIN `system`.numbers AS alias277
    ON number = alias277.number
LIMIT 102400
FORMAT Null
SETTINGS join_algorithm = 'parallel_hash';