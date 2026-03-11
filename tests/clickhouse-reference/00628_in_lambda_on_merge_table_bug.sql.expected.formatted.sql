SELECT
    key,
    arr_x,
    arr_y,
    _table
FROM
    test_in_tuple
LEFT ARRAY JOIN x AS arr_x, y AS arr_y
ORDER BY
    _table ASC,
    arr_x ASC,
    arr_y ASC;

SELECT
    key,
    arr_x,
    arr_y,
    _table
FROM
    test_in_tuple
LEFT ARRAY JOIN x AS arr_x, y AS arr_y
WHERE (key_2, arr_x, arr_y) IN (1, 1, 1)
ORDER BY
    _table ASC,
    arr_x ASC,
    arr_y ASC;

SELECT
    key,
    arr_x,
    arr_y,
    _table
FROM
    test_in_tuple
LEFT ARRAY JOIN arrayFilter((t, x_0, x_1) -> (key_2, x_0, x_1) IN (1, 1, 1), x, x, y) AS arr_x, arrayFilter((t, x_0, x_1) -> (key_2, x_0, x_1) IN (1, 1, 1), y, x, y) AS arr_y
WHERE (key_2, arr_x, arr_y) IN (1, 1, 1)
ORDER BY
    _table ASC,
    arr_x ASC,
    arr_y ASC;