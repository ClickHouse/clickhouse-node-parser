-- { echo }
select x3, x2, x1 from test order by 1;
select x3, x2, x1 from test order by -3;
select x3, x2, x1 from test order by x3;
select x3, x2, x1 from test order by 3;
select x3, x2, x1 from test order by -1;
select x3, x2, x1 from test order by x1;
select x3, x2, x1 from test order by 1 desc;
select x3, x2, x1 from test order by -3 desc;
select x3, x2, x1 from test order by x3 desc;
select x3, x2, x1 from test order by 3 desc;
select x3, x2, x1 from test order by -1 desc;
select x3, x2, x1 from test order by x1 desc;
select x3, x2 from test group by x3, x2 order by x3;
select x3, x2 from test group by 1, 2 order by x3;
select x1, x2, x3 from test order by x3 limit 1 by x3;
select x1, x2, x3 from test order by 3 limit 1 by 3;
select x1, x2, x3 from test order by x3 limit 1 by x1;
select x1, x2, x3 from test order by 3 limit 1 by 1;
select max(x1), x2 from test group by 1, 2; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }
select 1 + max(x1), x2 from test group by 1, 2; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }
select max(x1), x2 from test group by -2, -1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }
select 1 + max(x1), x2 from test group by -2, -1; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT, 184 }
select x1, x1 * 2, max(x2), max(x3) from test2 group by 2, 1, x1 order by 1, 2, 4 desc, 3 asc;
select x1, x1 * 2, max(x2), max(x3) from test2 group by 2, 1, x1 order by 1, 2, -1 desc, -2 asc;
select a, b, c, d, e, f  from (select 44 a, 88 b, 13 c, 14 d, 15 e, 16 f) t group by 1,2,3,4,5,6 order by a;
select a, b, c, d, e, f  from (select 44 a, 88 b, 13 c, 14 d, 15 e, 16 f) t group by 1,2,3,-3,-2,-1 order by a;
select substr('aaaaaaaaaaaaaa', 8) as a  group by a order by a;
select substr('aaaaaaaaaaaaaa', 8) as a  group by substr('aaaaaaaaaaaaaa', 8) order by a;
select b from (select 5 as a, 'Hello' as b order by a);
select b from (select 5 as a, 'Hello' as b group by a);
select b from (select 5 as a, 'Hello' as b order by 1);
select count(*) from (select first_col, count(second_col) from tp2 group by 1);
select total from (select first_col, count(second_col) as total from tp2 group by 1);
select first_col from (select first_col, second_col as total from tp2 order by 1 desc);
select first_col from (select first_col, second_col as total from tp2 order by 2 desc);
select max from (select max(first_col) as max, second_col as total from tp2 group by 2) order by 1;
select count(*) as `value`, 0 as `data` from test group by `data`;
