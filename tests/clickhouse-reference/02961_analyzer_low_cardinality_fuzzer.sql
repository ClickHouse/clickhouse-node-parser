SELECT 
  (tuple(log_date) = tuple('2021-01-01'), log_date)
FROM test_tuple_filter__fuzz_2
ORDER BY log_date;
