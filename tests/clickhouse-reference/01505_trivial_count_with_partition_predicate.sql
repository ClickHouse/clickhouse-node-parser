-- non-optimized
select count() from test1 settings max_parallel_replicas = 3;
-- optimized (toYear is monotonic and we provide the partition expr as is)
select count() from test1 where toYear(toDate(p)) = 1999;
-- non-optimized (toDate(DateTime) is always monotonic, but we cannot relaxing the predicates to do trivial count())
select count() from test1 where p > toDateTime('2020-09-01 10:00:00'); -- { serverError TOO_MANY_ROWS }
-- optimized (partition expr wrapped with non-monotonic functions)
select count() FROM test1 where toDate(p) = '2020-09-01' and sipHash64(toString(toDate(p))) % 2 = 1;
select count() FROM test1 where toDate(p) = '2020-09-01' and sipHash64(toString(toDate(p))) % 2 = 0;
-- non-optimized (some predicate depends on non-partition_expr columns)
select count() FROM test1 where toDate(p) = '2020-09-01' and k = 2; -- { serverError TOO_MANY_ROWS }
-- optimized
select count() from test1 where toDate(p) > '2020-09-01';
-- non-optimized
select count() from test1 where toDate(p) >= '2020-09-01' and p <= '2020-09-01 00:00:00';
-- optimized
select count() from test_tuple where toDate(p) > '2020-09-01';
-- optimized
select count() from test_tuple where toDate(p) > '2020-09-01' and i = 1;
-- optimized
select count() from test_tuple where i > 2;
-- optimized
select count() from test_tuple where i < 1;
-- non-optimized
select count() from test_tuple array join [p,p] as c where toDate(p) = '2020-09-01'; -- { serverError TOO_MANY_ROWS }
select count() from test_tuple array join [1,2] as c where toDate(p) = '2020-09-01' settings max_rows_to_read = 4;
-- non-optimized
select count() from test_tuple array join [1,2,3] as c where toDate(p) = '2020-09-01'; -- { serverError TOO_MANY_ROWS }
select count() from test_tuple array join [1,2,3] as c where toDate(p) = '2020-09-01' settings max_rows_to_read = 6;
-- optimized
select count() from test_two_args where i + j = 3;
-- non-optimized
select count() from test_two_args where i = 1; -- { serverError TOO_MANY_ROWS }
