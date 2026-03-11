select * from v4test_array_joins array join arr_1, arr_2, arr_3, arr_4 where match(arr_4,'a') and id < 100 order by id format Null settings optimize_read_in_order = 1;
