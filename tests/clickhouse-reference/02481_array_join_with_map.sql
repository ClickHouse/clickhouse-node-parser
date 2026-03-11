select s, arr1, map1 from arrays_test array join arr1, map1 settings enable_unaligned_array_join = 1;
select s, arr1, map1 from arrays_test left array join arr1, map1 settings enable_unaligned_array_join = 1;
select s, map1 from arrays_test array join map1;
select s, map1 from arrays_test left array join map1;
select s, map1, map2 from arrays_test array join map1, map2 settings enable_unaligned_array_join = 1;
select s, map1, map2 from arrays_test left array join map1, map2 settings enable_unaligned_array_join = 1;
