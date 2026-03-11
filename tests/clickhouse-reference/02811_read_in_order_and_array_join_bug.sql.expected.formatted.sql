SELECT *
FROM
    v4test_array_joins
ARRAY JOIN arr_1, arr_2, arr_3, arr_4
WHERE match(arr_4, 'a')
    AND id < 100
ORDER BY id ASC
FORMAT Null
SETTINGS optimize_read_in_order = 1;