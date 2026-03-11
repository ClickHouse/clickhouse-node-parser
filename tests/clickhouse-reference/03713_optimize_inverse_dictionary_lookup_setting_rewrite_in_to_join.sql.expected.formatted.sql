SELECT
    color_id,
    payload
FROM t
WHERE dictGetString('colors', 'name', color_id) = 'red'
ORDER BY
    color_id ASC,
    payload ASC;