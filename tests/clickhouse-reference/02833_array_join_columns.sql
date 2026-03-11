select * from v4test_array_joins array join columns('^arr') where match(arr_4,'a') and id < 100 order by id format Null settings optimize_read_in_order = 0;
