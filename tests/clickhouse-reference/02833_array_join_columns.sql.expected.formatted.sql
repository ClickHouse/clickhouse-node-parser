SELECT *
FROM
    v4test_array_joins
ARRAY JOIN columns('^arr')
WHERE match(arr_4, 'a')
    AND id < 100
ORDER BY id ASC
FORMAT Null
SETTINGS optimize_read_in_order = 0;