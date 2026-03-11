select key, arr_x, arr_y, _table from test_in_tuple left array join x as arr_x, y as arr_y order by _table, arr_x, arr_y;
select key, arr_x, arr_y, _table from test_in_tuple left array join x as arr_x, y as arr_y where (key_2, arr_x, arr_y) in (1, 1, 1) order by _table, arr_x, arr_y;
select key, arr_x, arr_y, _table from test_in_tuple left array join arrayFilter((t, x_0, x_1) -> (key_2, x_0, x_1) in (1, 1, 1), x, x ,y) as arr_x, arrayFilter((t, x_0, x_1) -> (key_2, x_0, x_1) in (1, 1, 1), y, x ,y) as arr_y where (key_2, arr_x, arr_y) in (1, 1, 1) order by _table, arr_x, arr_y;
