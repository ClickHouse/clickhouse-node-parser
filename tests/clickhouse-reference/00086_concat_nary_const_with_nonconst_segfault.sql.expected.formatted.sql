SELECT extract(toString(number), '10000000')
FROM `system`.numbers_mt
WHERE like(concat(materialize('1'), '...', toString(number)), '%10000000%')
LIMIT 1
SETTINGS max_rows_to_read = 0;